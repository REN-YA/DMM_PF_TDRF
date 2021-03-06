class Store::ProductsController < ApplicationController
  # before_action :correct_product,only: [:new,:edit,:destroy]

  def new
    @product = Product.new
    @store = current_store
  end

  def create
    #商品情報登録
    @product = Product.new(product_params)
     @product.store_id = current_store.id
    if @product.save
      redirect_to store_store_product_path(@product.store_id, @product.id)
    else
      render :new
    end
  end

  def index
    @store = Store.find(params[:store_id])
    @genres = Genre.where(store_id: @store)
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @store = Store.find(@product.store_id)
    @review = Review.new
    @reviews = Review.where(product_id: @product.id).page(params[:page]).per(10)

  end

  def edit
    @product = Product.find(params[:id])
     @store = Store.find(@product.store_id)
  end

  def update
     @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to store_store_product_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to store_store_products_path
  end

   private
  def product_params
    params.require(:product).permit(:store_id, :genre_id, :name, :image, :selling_price, :is_selling)
  end

  def review_params
      params.require(:review).permit(:user_id, :product_id, :contents, :evaluation )
  end

end
