class Review < ApplicationRecord

  has_many :notifications
  has_many :favorites
  belongs_to :users
  belongs_to :products
end
