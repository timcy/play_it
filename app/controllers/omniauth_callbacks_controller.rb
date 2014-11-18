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


    def twitter
         puts request.env["omniauth.auth"]
        @user = User.for_twitter(env["omniauth.auth"])
        puts "the user is#{@user}"
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "twitter".capitalize) if is_navigational_format?
        else
          redirect_to new_user_registration_url
        end
    end



def google_oauth2
     
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
 
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end