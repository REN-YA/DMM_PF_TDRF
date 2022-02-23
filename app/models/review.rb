class Review < ApplicationRecord

  has_many :notifications
  has_many :favorites
  belongs_to :user
  belongs_to :product

  def favorited_by?(review)
    favorites.where(review_id: user.id).exists?
  end
end
