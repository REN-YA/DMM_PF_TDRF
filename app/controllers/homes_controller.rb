class HomesController < ApplicationController

  def top
    @users = User.all
    @stores = Store.all
   
  end


end
