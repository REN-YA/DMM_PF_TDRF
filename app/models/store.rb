class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  #通知機能
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "store_id", dependent: :destroy

  has_many :products , dependent: :destroy
  has_many :genres , dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def active_for_authentication?
    super && (is_deleted == false)
  end



end
