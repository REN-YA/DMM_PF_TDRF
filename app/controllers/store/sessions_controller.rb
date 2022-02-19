# frozen_string_literal: true

class Store::SessionsController < Devise::SessionsController
  before_action :reject_store, only: [:create]

# 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_store
    @store = Store.find_by(email: params[:store][:email])
    if @store
      if @store.valid_password?(params[:store][:password]) && (@store.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_store_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
