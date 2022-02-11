class Notification < ApplicationRecord
  
  belongs_to :stores
  belongs_to :users
  belongs_to :reviews
end
