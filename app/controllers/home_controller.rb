class HomeController < ApplicationController
	def index
		if current_user
			puts "i am in current_user"
			redirect_to profile_home_index_path
		else
			redirect_to new_user_session_path
		end
	end

	def profile
		puts "i am in profile"
	end
end
