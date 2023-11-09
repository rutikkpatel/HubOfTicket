class CheckoutController < ApplicationController
  def create
    show = Show.find(params[:id])
    movie = Movie.find(show.movie_id)

    price = Stripe::Price.create({
      product_data: {
        name: movie.movie_title,
      },
      unit_amount: show.show_price,
      currency: 'usd',
    })

    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: price.id,
        quantity: 1
      }],
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
    })

    respond_to do |format|
      format.js
    end
  end
end
