class Photo < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :description, presence: true
<<<<<<< HEAD

  #scope :of_followed_users, lambda do |following_users|
   # where user_id: following_users
=======
>>>>>>> 3c9716b6b4711f61377762cf25ea70b0ad632643
end
