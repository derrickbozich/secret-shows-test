class ShowsController < ApplicationController
  def new
    @show = Show.new
    @show.artists.build
    @show.artists.build
  end

  def create

    # s = Show.create({
    #   city_name: params[:show][:city_name],
    #   venue_name: params[:show][:venue_name],
    #   artists_attributes: params[:show][:artists_attributes]
    #   })

    s = Show.create(show_params)
      binding.pry
    # s = Show.find_or_initialize_by(:name => params[:show][:name])
    # v = Venue.find_or_initialize_by(:name => params[:show][:venue])
    # c = City.find_or_create_by(:name => params[:show][:city])
    # a = Artist.find_or_create_by(:name => params[:show][:artists_attributes]['0'][:name])
    # s.city = c
    # v.city = c
    # s.venue = v
    # s.save!
    # v.save!

    s.save!


  end

  def show_params
    params.require(:show).permit(:name,:city_name, :venue_name, :artists_attributes => [:name])
  end


end
