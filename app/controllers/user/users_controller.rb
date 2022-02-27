class User::UsersController < ApplicationController
   before_action :correct_user,only: [:edit,:withdrawal]


  def index
    @users = User.all
    @stores = Store.page(params[:page]).per(20)
    @reviews = Review.where(user_id: @user.id)
    #自身の全レビューに対するいいねの総数
    @user_reviews = @user.reviews
      @review_favorites_count = 0
      @user_reviews.each do |review|
      @review_favorites_count += review.favorites.size
      end
      @total_favorites = @review_favorites_count
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id)
    #自身の全レビューに対するいいねの総数
    @user_reviews = @user.reviews
      @review_favorites_count = 0
      @user_reviews.each do |review|
      @review_favorites_count += review.favorites.size
      end
      @total_favorites = @review_favorites_count
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
     redirect_to user_user_path
    else
     render 'edit'
    end
  end

  def unsubscribe
  end

  def withdrawal
    @user = current_user
    current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user.id
      redirect_to root_path
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :image)
  end

end
