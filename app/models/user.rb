class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #mount_uploader :image, ImageUploader
  attachment :image

  has_many :relationships , dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  #通知機能
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  #フォロー・フォロワー機能
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings,through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def follow(user_id)
      relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
      relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
      followings.include?(user)
  end



  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
