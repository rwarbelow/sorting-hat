class UsersController < ApplicationController

  def new

  end

  def create
    user = User.new(user_params)
    user.role = 0
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Created new account!"
      redirect_to user_path(user.id)
    else
      render :new
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
