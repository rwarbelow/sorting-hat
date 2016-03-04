class Admin::PointsController < Admin::BaseController
  def new
    @user = User.find(params[:user_id])
    @point = Point.new
  end

  def create
    @user = User.find(params[:user_id])
    @point = @user.points.new(point_params)
    if @point.save
      redirect_to admin_users_path
    end
  end

  def destroy
    @point = Point.destroy(params[:id])
    flash[:notice] = "Deleted #{@point.value} points"
    redirect_to admin_user_path(@point.user)
  end

  private

  def point_params
    params.require(:point).permit(:value)
  end
end
