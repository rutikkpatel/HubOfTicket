class BookingsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_booking, only: [:edit, :update, :show, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @show = Show.find(params[:show_id].to_i)
    @booking = @show.bookings.new
  end

  def create
    @booking = Booking.new(booking_params.merge!(user: current_user))
    if @booking.save
      flash[:notice] = "Booking's details Added Successfully!"
      redirect_to show_bookings_path
    else
      flash[:error] = @booking.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      flash[:notice] = "Booking Record Has Been Updated Successfully!"
      redirect_to show_bookings_path
    else
      flash[:error] = "Updation Operation Has Been Failed!"
      render :edit
    end
  end

  def show
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to show_bookings_path
    else
      flash[:error] = "Deletion Operation Has Been Failed!"
    end
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:selected_seats, :number_of_seats, :booking_status, :user_id, :show_id, :movie_id, :theater_id)
  end
end