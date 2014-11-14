class Api::V1::SessionsController < Api::V1::BaseController

		
	def create
		user = User.find_for_database_authentication(:email => params[:session][:email])
		if user
			if user.valid_password?(params[:session][:password])
				render json:{:status=>true,:message => "Login Successfull",:access_token=>user.access_token}
			else
				render json:{:status=>false,:message => "Please Provide Valid Password"}
			end
		else
			render json:{:status=>false,:message=>"user not found"}
		end
		
	end
end