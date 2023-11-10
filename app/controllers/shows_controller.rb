class ShowsController < ApplicationController
  before_action :set_show, only: [:edit, :update, :destroy]

  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:notice] = "Show's details Added Successfully!"
      redirect_to shows_path
    else
      flash[:error] = "Show can't be added!"
      render :new
    end
  end

  def edit
  end

  def update
    if @show.update(show_params)
      flash[:notice] = "Show Has Been Updated Successfully!"
      redirect_to shows_path
    else
      flash[:error] = "Updation Operation Has Been Failed!"
      render :edit
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @shows = @movie.shows
  end

  def destroy
    @show = Show.find(params[:id])
    if @show.destroy
      redirect_to shows_path
    else
      flash[:error] = "Deletion Operation Has Been Failed!"
    end
  end

  private
  def set_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(:show_date, :show_time, :movie_id, :theater_id)
  end
end