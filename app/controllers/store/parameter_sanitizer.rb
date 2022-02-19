class Store::ParameterSanitizer < Devise::ParameterSanitizer

  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :email, :encrypted_password, :image_id, :store_genres, :post_code, :address, :business_hours, :reservation_site, :telephone_number] )
  end

end
