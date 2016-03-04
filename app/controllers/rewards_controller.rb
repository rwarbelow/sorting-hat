class RewardsController < ApplicationController
  before_action :require_current_user

  def index
    @rewards = Reward.all
  end

  def create
    user = current_user
    reward = Reward.find(params[:reward_id])

    if user.has_points_for?(reward)
      user.process(reward)
      redirect_to user_path(user.id)
    else
      flash[:error] = "Sorry you don't have enough points for that. Go talk to Snape."
      redirect_to rewards_path
    end
  end
end
