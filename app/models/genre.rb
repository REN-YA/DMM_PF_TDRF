class Genre < ApplicationRecord

  has_many :products
  belongs_to :store

  validates :name, {presence: true}
end
