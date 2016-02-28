class RewardsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      redirect_to reward_path(@reward.id)
    else
      render :edit
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def destroy
    Reward.destroy(params[:id])
    redirect_to rewards_path
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to rewards_path
    else
      render :new
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :cost)
  end
end
