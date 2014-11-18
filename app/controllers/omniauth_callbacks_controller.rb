class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])
	    # if @user.persisted?
	    	sign_in @user
	    	# puts "current user is #{current_user}"
	    	redirect_to root_path
		# end
      	# set_flash_message(:notice, :success, :kind => 'Facebook') if is_navigational_format?
    end
end