class User::RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def create
    # binding.pry
    user = current_user
    reward = Reward.find(params[:reward_id])

    if user.points.total > reward.cost
      user.rewards << reward
      user.points.create(value: -reward.cost)
      redirect_to user_path(user.id)
    else
      render :index
    end
  end
end
