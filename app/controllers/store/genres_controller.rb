class Store::GenresController < ApplicationController
  before_action :authenticate_store!
  before_action :correct_genre,only: [:new,:edit,:destroy]

  def index
    @genre = Genre.new
    @store = current_store
    @item = @store.products
    @genres = @item.group(:genre_id)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to store_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to store_genres_path
    else
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to store_genres_path
  end

  def correct_genre
    @genre = Genre.find(params[:id])
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
