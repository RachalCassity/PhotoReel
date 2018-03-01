class Photo < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :description, presence: true

  #scope :of_followed_users, lambda do |following_users|
   # where user_id: following_users
end
