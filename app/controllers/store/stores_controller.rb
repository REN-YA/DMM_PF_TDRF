class Store::StoresController < ApplicationController


  def index
    @users = User.page(params[:page]).per(10)
    @stores = Store.page(params[:page]).per(10)
  end

  def show
    @store = Store.find(params[:id])
    @reviews = Review.where(product_id: Product.where(store_id: @store.id).ids).page(params[:page]).per(10)
    @user = User.all
  end

  def edit
    @store = current_store
  end

  def update
    @store = current_store
    if @store.update(store_params)
     redirect_to store_store_path
    else
     render 'edit'
    end
  end

  def unsubscribe
  end

  def withdrawal
    @store = current_store
    current_store.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def correct_store
    @store = Store.find(params[:id])
    unless @store == current_store.id
      redirect_to root_path
    end
  end

  private
  def store_params
    params.require(:store).permit(:name, :email, :encrypted_password, :image, :store_genres, :post_code, :address, :business_hours, :reservation_site, :telephone_number, :latitude, :longitude)
  end

end
