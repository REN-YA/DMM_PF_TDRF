class Product < ApplicationRecord
  
  
  attachment :image
  
  belongs_to :stores
  belongs_to :genres
  has_many :reviews
end
