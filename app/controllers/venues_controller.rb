class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find_by_id(params[:id])
  end

  def edit
    @venue = Venue.find_by_id(params[:id])
  end

  def update
    @venue = Venue.find_by_id(params[:id])
    @venue.update(venue_params)
    if @venue.save
      flash[:success] = "Venue Edited!"
      redirect_to shows_path
    else
      flash[:error] = "Venue Edit Failed"
      render 'edit'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name)
  end
end
