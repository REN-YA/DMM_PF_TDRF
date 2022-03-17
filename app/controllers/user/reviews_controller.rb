class User::ReviewsController < ApplicationController
  # before_action :correct_review,only: [:edit,:destroy]

  def new
    @review = Review.new
  end

  def create
     @product = Product.find(review_params[:product_id])
     @review = @product.reviews.build(review_params)
     @review.score = Language.get_data(review_params[:contents])
     @review.user_id = current_user.id

    if @review.save
      #通知の作成
      @product.create_notification_review!(current_user, @review.id)
      redirect_to user_review_path(@review.id)
    else
      @reviews = Review.where(product_id: @product.id)
      render "/store/products/show"

    end
  end

  def show
    @review = Review.find(params[:id])
    @user = User.find(@review.user_id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
     @review = Review.find(params[:id])
     @review.score = Language.get_data(review_params[:contents])
    if @review.update(review_params)
      redirect_to user_review_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to store_store_product_path(@review.product.store_id, @review.product_id)
  end

  # def correct_review
  #       @review = Review.find(params[:id])
  #   unless @review.user.id == current_user.id
  #     redirect_to root_path
  #   end
  # end

  private
  def review_params
      params.require(:review).permit(:user_id, :product_id, :contents, :evaluation )
  end
end
