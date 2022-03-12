class Review < ApplicationRecord

  has_many :notifications , dependent: :destroy
  has_many :favorites , dependent: :destroy
  belongs_to :user
  belongs_to :product

  validates :contents, {presence: true}
  validates :evaluation, {presence: true}

  def favorited_by?(user)
    favorites.where(user_id: user_id).exists?
  end
  
  def create
    @product = Product.find(params[:item_id])
    #商品に紐づいたレビューを作成
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id
    @review_product = @review.product
    if @review.save
      #通知の作成
      @review_product.create_notification_comment!(current_user, @review.id)
      render :index
    end
  end

end
