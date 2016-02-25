class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if current_user.admin?
        redirect_to admin_user_path(user.id)
      else
        redirect_to user_path(user.id)
      end
    else
      render :new
    end
  end

end
