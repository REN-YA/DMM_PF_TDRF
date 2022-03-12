class Product < ApplicationRecord

  attachment :image

  belongs_to :store
  belongs_to :genre
  has_many :reviews , dependent: :destroy
  has_many :notifications , dependent: :destroy

  validates :name, {presence: true}
  validates :image, {presence: true}
  validates :genre_id, {presence: true}
  validates :selling_price, {presence: true}
  validates :is_selling, {presence: true}

  enum is_selling: { on_sale: true, no_sale: false }

  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
    product_id: id,
    store_id: storer_id,
    action: "review"
    )
    notification.save if notification.valid?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
    product_id: id,
    review_id: review_id,
    store_id: store_id,
    action: 'review'
    )
  end

end
