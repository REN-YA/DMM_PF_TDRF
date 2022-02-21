class User::RelationshipsController < ApplicationController

  def index
    @followings = User.followings.all
    @followers = User.followers.all
  end
   # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @followings = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @followers = user.followers
  end

end
