class ShowsController < ApplicationController
  def new
    if logged_in?
      @show = Show.new
      @show.artists.build
      @show.artists.build
    else
      redirect_to shows_path
    end

  end

  def create

    # s = Show.create({
    #   city_name: params[:show][:city_name],
    #   venue_name: params[:show][:venue_name],
    #   artists_attributes: params[:show][:artists_attributes]
    #   })

    @show = Show.create(show_params)
    
    redirect_to shows_path
  end

  def index
    @shows = Show.all
  end

  def show
    @show = Show.find_by_id(params[:id])
  end

  def show_params
    params.require(:show).permit(:name,:city_name, :venue_name, :date, :time, :artists_attributes => [:name])
  end


end
