class Review < ApplicationRecord

  has_many :notifications , dependent: :destroy
  has_many :favorites , dependent: :destroy
  belongs_to :user
  belongs_to :product

  validates :contents, {presence: true}
  validates :evaluation, {presence: true}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
