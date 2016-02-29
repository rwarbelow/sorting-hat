class WelcomeController < ApplicationController

  def show
    if current_user && current_user.admin?
      redirect_to admin_dashboard_path
    elsif current_user
      redirect_to user_path(current_user.id)
    end
  end

end
