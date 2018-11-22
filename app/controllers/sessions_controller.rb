class SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to shows_path
    end
  end

  def logout
    if logged_in?
      session.clear
      redirect_to login_path
    else
      redirect_to '/'
    end
  end

  def create
    @user = User.find_or_create_by(id: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      # u.password = 'ab'
      # u.image = auth['info']['image']
    end

    # @user.password = 'a'

    session[:user_id] = @user.id
    # @current_user = @user
    binding.pry
    redirect_to shows_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
