class Store::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    #商品情報登録
    @product = Product.new(product_params)
     @product.store_id = current_store.id
    if @product.save
      redirect_to store_product_path(@product.id)
    else
      render :new
    end
  end

  def index
    @genres = Genre.all
    @products = Product.all
    @store = current_store
  end

  def show
    @product = Product.find(params[:id])
    @store = Store.find(@product.store_id)
    # @review = Review.new
    @reviews = Review.page(params[:page]).per(20)
    
      # @product_reviews = @product.reviews
      # @review_evaluation_count = 0
      #   @product_reviews.each do |review|
      #   @review_evaluation_count += review.evaluation.size
      #   end
      # @product_average = @review.evaluation_count

  end

  def edit
    @product = Product.find(params[:id])
     @store = Store.find(@product.store_id)
  end

  def update
     @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to store_product_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to store_products_path
  end

   private
  def product_params
    params.require(:product).permit(:store_id, :genre_id, :name, :image, :selling_price, :is_selling)
  end

end
