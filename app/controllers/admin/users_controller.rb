class Admin::UsersController < Admin::BaseController

  def show
    @user = User.find(params[:id])
    @points = @user.points
  end

  def index
    @users = User.all
  end

  def dashboard
    @image = Image.get(current_user.id)
  end
end
