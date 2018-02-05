class UsersController < ApplicationController
  before_action :set_user,
                :set_following_status,
                only: %i[show followers following]

  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find_by!(username: params[:username])
  end

  def followers
  end

  def following
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

  def set_user
    @user = User.find_by!(username: params[:username])
  end

  def set_following_status
    if @user == current_user
      @following = false
    else
      @following = Follow.where(follower_id: current_user.id, following_id: @user.id).exists?
    end
  end
end
