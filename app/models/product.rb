class Product < ApplicationRecord
  
  belongs_to :stores
  belongs_to :genres
  has_many :reviews
end
