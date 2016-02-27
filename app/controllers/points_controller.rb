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

  def destroy
    @point = Point.find(params[:id])
    @user = User.find(params[:user_id])
    flash[:notice] = "Deleted #{@point.value} points"
    Point.destroy(@point.id)
    redirect_to admin_user_path(@user)
  end

  private

  def point_params
    params.require(:point).permit(:value)
  end
end
