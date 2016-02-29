class UsersController < ApplicationController

  def new
    @user = User.new
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
    @user = User.find(params[:id])
    @rewards = @user.rewards
    @image = Image.get(@user.id)
    render file: "/public/404" unless current_user && current_user.id == @user.id
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
