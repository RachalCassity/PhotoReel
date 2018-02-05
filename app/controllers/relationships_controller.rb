class RelationshipsController < ApplicationController

  def follows
    @follows = Follow.where(following_id: @user.id)
  end
  
  def follow_user
    @user = User.find_by!(username: params[:username])
    following = Follow.where(follower_id: current_user.id, following_id: @user.id).exists?
    if !following
      Follow.create!(follower_id: current_user.id, following_id: @user.id) 
    end
    redirect_to user_path(@user)
  end

  def unfollow_user
    @user = User.find_by!(username: params[:username])
    follow = Follow.where(follower_id: current_user.id, following_id: @user.id).first
    if following 
      following.destroy
    end
    redirect_to user_path(@user)
  end
end
