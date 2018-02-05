class Like < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  
	validates :user, presence: true, uniqueness: {user: :photo}
  validates :photo, presence: true
end
