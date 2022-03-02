class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :products
  has_many :genres
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
