class CitiesController < ApplicationController
  def index
    @cities = City.alphabetize
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @cities}
    end

  end

  def show
    @city = City.find_by_id(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @city, include: ['shows.venue', 'shows.artists']}
    end
  end

  def next_show
    city = City.find_by_id(params[:city_id])
    show = Show.find_by_id(params[:show_id])
    direction = params[:direction]
    @next_show = city.next_show(show, direction)
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @next_show, include: ['venue', 'artists', 'user']}
    end
  end







end
