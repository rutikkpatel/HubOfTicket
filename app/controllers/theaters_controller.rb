class TheatersController < ApplicationController
  before_action :set_theater, only: [:edit, :update, :show, :destroy]

  def index
    @theaters = Theater.all
  end

  def new
    @theater = Theater.new
  end

  def create
    @theater = Theater.new(theater_params)
    if @theater.save
      flash[:notice] = "Theater's details Added Successfully!"
      redirect_to theaters_path
    else
      flash[:error] = "Theater can't be added!"
      render :new
    end
  end

  def edit
  end

  def update
    if @theater.update(theater_params)
      flash[:notice] = "Theater Has Been Updated Successfully!"
      redirect_to theaters_path
    else
      flash[:error] = "Updation Operation Has Been Failed!"
      render :edit
    end
  end

  def show
  end

  def destroy
    @theater = Theater.find(params[:id])
    if @theater.destroy
      redirect_to theaters_path
    else
      flash[:error] = "Deletion Operation Has Been Failed!"
    end
  end

  private
  def set_theater
    @theater = Theater.find(params[:id])
  end

  def theater_params
    params.require(:theater).permit(:theater_name, :city, :theater_address, :movie_id)
  end
end