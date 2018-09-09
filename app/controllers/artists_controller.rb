class ArtistsController < ApplicationController
  def show
    @artist = Artist.find_by_id(params[:id])
  end

  def search
    query = params[:query]
    @artist = Artist.where('name LIKE ?', query).first
  end
end
