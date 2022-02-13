class Store::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
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
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
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
