class User::RewardsController < ApplicationController
  before_action :require_current_user

  def index
    @rewards = Reward.all
  end

  def create
    user = current_user
    reward = Reward.find(params[:reward_id])

    if user.points.balance >= reward.cost
      user.rewards << reward
      user.points.create(value: -reward.cost)
      redirect_to user_path(user.id)
    else
      flash.now[:error] = "Sorry you don't have enough points for that. Go talk to Snape."
      @rewards = Reward.all
      render :index
    end
  end
end
