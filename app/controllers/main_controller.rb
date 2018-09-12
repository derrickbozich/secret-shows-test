class MainController < ApplicationController
  # before_action :force_json, only: :search


  def search
    # query = params[:query]

    @artists = Artist.ransack(name_cont: params[:q]).result(distinct: true)
    @cities = City.ransack(name_cont: params[:q]).result(distinct: true)
    # @artists = Artist.where('name LIKE ?', params[:q]).first

    respond_to do |format|
      format.html {}
      format.json{
        @artists = @artists
        @cities = @cities
      }
    end

    # how to manually parse through JSON
    # array = []
    # artists.each do |artist|
    #   url = artist_path(artist)
    #   name = artist.name
    #   hash = {name: name, url: url}
    #   array << hash
    #
    # end
    # @artists = array.map{|artist| artist.to_json}
    #
    # render json: {artists: @artists}
  end
  #
  # private
  #
  # def force_json
  #   request.format = :json
  # end
end
