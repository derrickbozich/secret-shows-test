class ShowsController < ApplicationController
  def new
    if user_signed_in?
      @show = Show.new
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
      flash[:success] = "Show Created!"
      # without ajax call, we would redirect to the show index page and see the new show
        # redirect_to shows_path
      #instead send json info of all shows (including the newly created one)
      #to get rendered via handlebars in the dom
      @shows = Show.all
      render json: @shows
    else
      render 'new'
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
    @show.update(show_params)

    if @show.save
      flash[:success] = "Show Edited!"
      redirect_to show_path(@show)
    else
      render 'edit'
    end

  end

  def destroy
    @show = Show.find_by_id(params[:id])
    if current_user.shows.include?(@show)
      @show.destroy
      flash[:success] = "Show Deleted!"
      redirect_to shows_path
    else
      flash[:error] = "Show Was Not Deleted!"
      redirect_to shows_path
    end

  end

  def show_params
    params.require(:show).permit(:name,:city_name, :venue_name, :date, :time, :poster, :artists_attributes => [:name, :image])
  end


end
