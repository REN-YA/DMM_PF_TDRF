class User::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
   @review = Review.new(review_params)
     @review.user_id = current_user.id
    if @review.save
      redirect_to user_review_path(@review.id)
    else
      render :new
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

  private
  def review_params
      params.require(:review).permit(:user_id, :product_id, :contents, :evaluation )
  end
end
