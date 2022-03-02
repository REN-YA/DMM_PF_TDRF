class Store::ProductsController < ApplicationController
  # before_action :correct_product,only: [:new,:edit,:destroy]

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
    @stores = Store.all

  end

  def show
    @product = Product.find(params[:id])
    @store = Store.find(@product.store_id)
    @review = Review.new
    @reviews = Review.where(product_id: @product.id)

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

  # def correct_product
  #   @product = Product.find(params[:id])
  #   unless @product.store.id == current_store.id
  #     redirect_to root_path
  #   end
  # end

   private
  def product_params
    params.require(:product).permit(:store_id, :genre_id, :name, :image, :selling_price, :is_selling)
  end

  def review_params
      params.require(:review).permit(:user_id, :product_id, :contents, :evaluation )
  end

end
