class LikingController < ApplicationController
	before_action :fetch_photo
	
	def likes
		@likes = Like.where(photo_id: @photo.id)
	end

	def like
		liking = Like.where(user_id: current_user.id, photo_id: @photo.id).exists?
    if !liking
			Like.create!(user_id: current_user.id, photo_id: @photo.id)
		end
		redirect_to photos_path
	end

	def unlike
		liking = Like.where(user_id: current_user.id, photo_id: @photo.id).first
		if liking
			liking.destroy
		end
		redirect_to photos_path
	end

	private

	def fetch_photo
		@photo = Photo.find_by!(id: params[:id])
	end
end
