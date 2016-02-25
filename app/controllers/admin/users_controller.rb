class Admin::UsersController < Admin::BaseController

  def show

  end

  def index
    @users = User.all
  end

end
