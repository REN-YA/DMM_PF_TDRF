class Product < ApplicationRecord

  attachment :image

  belongs_to :store
  belongs_to :genre
  has_many :reviews

  enum is_selling: { on_sale: true, no_sale: false }
end
