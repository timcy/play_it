class Api::V1::UsersController < Api::V1::BaseController
	
	def create
		user = User.create(user_param)
		if user.valid?
			render json:{:status => true,:message => "Signup Successfull"}
		else
			render json:{:status => false,:message => user.errors.full_messages}	
		end
	end

	def show 
		puts "the api usr is #{api_user}"
		respond_with api_user.as_json(except: :password_digest)
	end

	private 
	def user_param
		params.require(:user).permit(:email,:password,:password_confirmation)
	end
end