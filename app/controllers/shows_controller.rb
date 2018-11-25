class ShowsController < ApplicationController
  def new
    if user_signed_in?
      @show = Show.new
      if id = params[:city_id]
        city = City.find_by_id(id.to_i)
        @show.city = city
      end
      @show.artists.build
    else
      flash[:error] = "You Must Login to Create A Show"
      redirect_to shows_path
    end

  end

  def create

    # s = Show.create({
    #   city_name: params[:show][:city_name],
    #   venue_name: params[:show][:venue_name],
    #   artists_attributes: params[:show][:artists_attributes]
    #   })
    @show = Show.new(show_params)
    @show.user_id = current_user.id  if current_user

    if @show.save && ShowArtist.last.save

      show_artists = ShowArtist.where("show_id == ?", @show.id)

      show_artists.each_with_index do |show_artist, i|
        order = params[:show][:artists_attributes][i][:set_order].to_i
        show_artist.set_order = order
      end
      # flash[:success] = "Show Created!"
      # without ajax call, we would redirect to the show index page and see the new show
        # redirect_to shows_path
      #instead send json info of all shows (including the newly created one)
      #to get rendered via handlebars in the dom
      @shows = Show.all
      render json: @shows
    else
      render :new
    end
  end

  def index
    @shows = Show.upcoming_shows
    respond_to do |format|
      format.html {render :index }
      format.json {render json: @shows}
    end
  end

  def show
    @show = Show.find_by_id(params[:id])
    respond_to do |format|
      format.html {render :show }
      format.json {render json: @show, include: [:artists, :venue, :city]}
    end
  end

  def edit
    @show = Show.find_by_id(params[:id])
  end

  def update
    @show = Show.find_by_id(params[:id])
    @show.artists.destroy_all
    @show.update!(show_params)

    if @show.save
      show_artists = ShowArtist.where("show_id == ?", @show.id)

      show_artists.each_with_index do |show_artist, i|
        order = params[:show][:artists_attributes][i][:set_order].to_i
        show_artist.set_order = order
      end
      @shows = Show.all
      # flash[:success] = "Show Edited!"
      respond_to do |format|
        # format.html {render :show }
        format.json {render json: @shows}
      end

      # redirect_to '/test'
    else
      render 'edit'
    end

  end

  def destroy
    @show = Show.find_by_id(params[:id])
    if current_user.shows.include?(@show)
      @show.destroy
      # flash[:success] = "Show Deleted!"
      redirect_to shows_path
    else
      flash[:error] = "Show Was Not Deleted!"
      redirect_to shows_path
    end

  end

  def show_params
    params.require(:show).permit(:name,:city_name, :venue_name, :date, :time, :poster, :artists_attributes => [:name, :image, :set_order])
  end

end
