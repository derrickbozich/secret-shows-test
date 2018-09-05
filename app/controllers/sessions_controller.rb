class SessionsController < ApplicationController
  def login

    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to shows_path
    end
    # redirect_to login_path
  end

  def logout
    if logged_in?
      session.clear
      binding.pry
      redirect_to login_path
    else
      redirect_to '/'
    end

  end


end
