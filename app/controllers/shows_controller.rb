class ShowsController < ApplicationController
  def new
    if logged_in?
      @show = Show.new
      @show.artists.build
      @show.artists.build
    else
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
      redirect_to shows_path
    else
      render 'new'
    end
  end

  def index
    @shows = Show.upcoming_shows
  end

  def show
    @show = Show.find_by_id(params[:id])
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
