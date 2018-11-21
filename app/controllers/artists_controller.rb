class ArtistsController < ApplicationController
  def show
    @artist = Artist.find_by_id(params[:id])
    respond_to do |format|
      format.html {render :show }
      format.json {render json: @artist, include: [:shows]}
    end
  end


end
