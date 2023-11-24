class CheckoutController < ApplicationController
  def create
    session[:number_of_seats] = params[:booking][:number_of_seats]
    session[:selected_seats] = params[:booking][:selected_seats]
    session[:show_id] = params[:booking][:show_id]
    session[:theater_id] = params[:booking][:theater_id]
    session[:movie_id] = params[:booking][:movie_id]
    session[:user_id] = params[:booking][:user_id]
    
    show = Show.find(session[:show_id])
    movie = Movie.find(session[:movie_id])

    # Create a dynamic Stripe Price for the movie
    price = Stripe::Price.create({
      product_data: {
        name: movie.movie_title,
      },
      unit_amount: show.show_price * 100,
      currency: 'cad',
    })

    @session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_customer_id,
      payment_method_types: ['card'],
      line_items: [{
        price: price.id,
        quantity: session[:number_of_seats].to_i,
      }],
      mode: 'payment',
      success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: failure_url,
    })
    
    respond_to do |format|
      format.js
    end
  end

  def success
    booking = Booking.new(number_of_seats: session[:number_of_seats], selected_seats: session[:selected_seats], show_id: session[:show_id], theater_id: session[:theater_id], movie_id: session[:movie_id], user_id: session[:user_id])

    # if booking.save
    #   # Clear session variables after successful booking
    #   session[:number_of_seats] = nil
    #   session[:selected_seats] = nil
    #   session[:show_id] = nil
    #   session[:theater_id] = nil
    #   session[:movie_id] = nil
    #   session[:user_id] = nil
    # end
    
    # Retrieve the expanded session information
    @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ['payment_intent', 'line_items.data.price.product'] })
    PaymentSuccessMailer.new_payment_email(current_user, @session_with_expand).deliver_now
    # @session_with_expand.line_items.data.each do |line_item|
		# 	show = Show.find_by(stripe_show_id: line_item.price.product)
    # end
  end

  def failure
  end
end
