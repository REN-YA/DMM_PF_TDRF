class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
    @users = User.page(params[:page]).per(20)
    @stores = Store.page(params[:page]).per(20)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'store'
      if method == 'perfect'
        Store.where(name: content)
      elsif method == 'forward'
        Store.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        Store.where('name LIKE ?', '%'+content)
      else
        Store.where('name LIKE ?', '%'+content+'%')
      end
    end
  end
end

