class User::ReviewsController < ApplicationController
  before_action :correct_review,only: [:edit,:destroy]

  def new
    @review = Review.new
  end

  def create
     @product = Product.find_by(params[:id])
     @review = Review.new(review_params)
     @review.user_id = current_user.id
    if @review.save
      redirect_to user_review_path(@review.user.id)
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
    if @review.update(review_params)
      redirect_to user_review_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to store_products_path
  end

  def correct_review
        @review = Review.find(params[:id])
    unless @review.user.id == current_user.id
      redirect_to root_path
    end
  end

  private
  def review_params
      params.require(:review).permit(:user_id, :product_id, :contents, :evaluation )
  end
end
