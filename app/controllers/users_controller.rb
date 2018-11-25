class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to shows_path
    else
      render :new
    end
  end

  def show
    # if current_user.id == params[:id]
    #   @user = current_user
    # else
    #   redirect_to shows_path
    # end
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
