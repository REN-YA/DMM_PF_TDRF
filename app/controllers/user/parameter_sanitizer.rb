class User::ParameterSanitizer < Devise::ParameterSanitizer

  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :email, :encrypted_password, :image] )
  end

end
