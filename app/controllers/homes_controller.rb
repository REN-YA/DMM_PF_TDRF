class HomesController < ApplicationController

  def top
    @users = User.page(params[:page]).per(20)
    @stores = Store.page(params[:page]).per(20)
    @reviews = Review.all

  end

end
