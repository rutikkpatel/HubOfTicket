class ScreensController < ApplicationController
  before_action :set_screen, only: [:edit, :update, :show, :destroy]

  def index
    @screens = Screen.all
  end

  def new
    @screen = Screen.new
    @movies = Movie.all.map{ |m| [m.movie_title, m.id] }
    @theaters = Theater.all.map{ |t| [t.theater_name, t.id] }
  end

  def create
    @screen = Screen.new(screen_params)
    if @screen.save
      flash[:notice] = "Screen's details Added Successfully!"
      redirect_to screens_path
    else
      flash[:error] = "Screen can't be added!"
      render :new
    end
  end

  def edit
  end

  def update
    if @screen.update(screen_params)
      flash[:notice] = "Screen Has Been Updated Successfully!"
      redirect_to screens_path
    else
      flash[:error] = "Updation Operation Has Been Failed!"
      render :edit
    end
  end

  def show
  end

  def destroy
    @screen = Screen.find(params[:id])
    if @screen.destroy
      redirect_to screens_path
    else
      flash[:error] = "Deletion Operation Has Been Failed!"
    end
  end

  private
  def set_screen
    @screen = Screen.find(params[:id])
  end

  def screen_params
    params.require(:screen).permit(:screen_name, :movie_id, :theater_id)
  end
end