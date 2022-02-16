class Review < ApplicationRecord

  has_many :notifications
  has_many :favorites
  belongs_to :user
  belongs_to :product
end
