class User::UsersController < ApplicationController

  def index
    @users = User.all
    @stores = Store.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.all
    @favorites = Favorite.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
     redirect_to user_users_path
    else
     render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :image_id)
  end

end
