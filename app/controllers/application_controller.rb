class ApplicationController < ActionController::Base


  protected
  #ログイン後の遷移先設定
  def after_sign_in_path_for(resource)
    if user_signed_in?
       user_user_path(@user.id)
    else
       store_store_path(@store.id)
    end
  end

  #ログアウト後、遷移先設定
  def after_sign_out_path_for(resource)
   root_path
  end

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    elsif resource_class == Store
      Store::ParameterSanitizer.new(Store, :store, params)
    else
      super
    end
  end


end
