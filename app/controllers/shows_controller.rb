class ShowsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_show, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @movie = Movie.find(params[:movie_id].to_i)
    @shows = @movie.shows
  end

  def new
    @movie = Movie.find(params[:movie_id].to_i)
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:notice] = "Show's details Added Successfully!"
      redirect_to movie_shows_path
    else
      flash[:error] = "Show can't be added!"
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id].to_i)
  end

  def update
    if @show.update(show_params)
      flash[:notice] = "Show Has Been Updated Successfully!"
      redirect_to movie_shows_path
    else
      flash[:error] = "Updation Operation Has Been Failed!"
      render :edit
    end
  end

  def show
    @movie = Movie.find(params[:movie_id].to_i)
    @show = Show.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:movie_id].to_i)
    @show = Show.find(params[:id])
    if @show.destroy
      redirect_to movie_shows_path
    else
      flash[:error] = "Deletion Operation Has Been Failed!"
    end
  end

  private
  def set_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(:show_date, :show_time, :total_seats, :remaining_seats,:show_price, :movie_id, :theater_id)
  end
end