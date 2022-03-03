class Product < ApplicationRecord

  attachment :image

  belongs_to :store
  belongs_to :genre
  has_many :reviews , dependent: :destroy

  validates :name, {presence: true}
  validates :image, {presence: true}
  validates :genre_id, {presence: true}
  validates :selling_price, {presence: true}
  validates :is_selling, {presence: true}


  enum is_selling: { on_sale: true, no_sale: false }
end
