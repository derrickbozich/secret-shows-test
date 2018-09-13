class MainController < ApplicationController

  def search
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
  end
end
