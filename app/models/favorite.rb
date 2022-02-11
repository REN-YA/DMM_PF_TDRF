class Favorite < ApplicationRecord
  
  has_many :users
  belongs_to :reviews
end
