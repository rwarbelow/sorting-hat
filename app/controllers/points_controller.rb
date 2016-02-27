class PointsController < Admin::BaseController
  def new
    @user = User.find(params[:user_id])
    @point = Point.new
  end

  def create
    @point = Point.new(point_params)
    user = User.find(params[:user_id])
    @point.user = user
    if @point.save
      redirect_to admin_users_path
    end
  end

  private

  def point_params
    params.require(:point).permit(:value)
  end
end
