class Api::V1::UsersController < Api::V1::BaseController
	
	def create
		user = User.create(user_param)
		if user.valid?
			render json:{:status => true,:message => "Signup Successfull"}
		else
			render json:{:status => false, :status_code=>3001,:message => user.errors.full_messages}	
		end
	end

	private 
	def user_param
		params.require(:user).permit(:email,:password,:password_confirmation)
	end
end