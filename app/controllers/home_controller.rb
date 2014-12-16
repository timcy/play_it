class HomeController < ApplicationController
	
	def index
		if current_user
			redirect_to profile_path
		else
			redirect_to new_user_session_path
		end
	end

	def profile
		@photos = current_user.photos
		@photo = current_user.photos.new
	end

	def create
		@photo = current_user.photos.create photo_params
		redirect_to profile_path
	end

	# def update
	# 	@user = User.find(params[:id])
	# 	@user.update_attributes user_params
	# 	redirect_to profile_path
		

	# end

	private

	def photo_params
		params.require(:photo).permit!
	end
	
end
