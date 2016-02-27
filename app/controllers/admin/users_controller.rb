class Admin::UsersController < Admin::BaseController

  def show
    @user = User.find(params[:id])
    @points = @user.points
  end

  def index
    @users = User.all
  end

  def dashboard
  end
end
