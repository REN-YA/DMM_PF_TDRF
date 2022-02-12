class Store::StoresController < ApplicationController

  def index
    @users = User.all
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = current_store
  end

  def update
    @store = current_store
    if @store.update(store_params)
     redirect_to store_stores_path
    else
     render 'edit'
    end
  end

  private
  def store_params
    params.require(:store).permit(:name, :email, :encrypted_password, :image_id, :store_genres, :post_code, :address, :business_hours, :reservation_site, :telephone_number)
  end

end
