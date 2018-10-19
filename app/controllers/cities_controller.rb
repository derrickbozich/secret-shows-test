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
      format.json {render json: @city}
    end
  end






end
