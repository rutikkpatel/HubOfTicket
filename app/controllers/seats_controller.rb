class SeatsController < ApplicationController
  before_action :set_seat, only: [:edit, :update, :show, :destroy]

  def index
    @seats = Seat.all
  end

  def new
    @seat = Seat.new
  end

  def create
    @seat = Seat.new(seat_params)
    if @seat.save
      flash[:notice] = "Seat's details Added Successfully!"
      redirect_to seats_path
    else
      flash[:error] = "Seat can't be added!"
      render :new
    end
  end

  def edit
  end

  def update
    if @seat.update(seat_params)
      flash[:notice] = "Seat Has Been Updated Successfully!"
      redirect_to seats_path
    else
      flash[:error] = "Updation Operation Has Been Failed!"
      render :edit
    end
  end

  def show
  end

  def destroy
    @seat = Seat.find(params[:id])
    if @seat.destroy
      redirect_to seats_path
    else
      flash[:error] = "Deletion Operation Has Been Failed!"
    end
  end

  private
  def set_seat
    @seat = Seat.find(params[:id])
  end

  def seat_params
    params.require(:seat).permit(:no_of_seats)
  end
end