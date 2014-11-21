class Api::V1::SessionsController < Api::V1::BaseController

		
	def create
		user = User.find_for_database_authentication(:email => params[:session][:email])
		if user
			if user.valid_password?(params[:session][:password])
				respond_with({:status=>200,:success => "Login Successfull",:access_token=>user.access_token},:location=>nil)
			else
				# render json:{:status=>false,:message => "Please Provide Valid Password"}
				respond_with({:error=>"Password is invalid", :status => 401}, :location => nil)
			end
		else
			respond_with({:error=>"User not found",:status => 400},:location => nil)
		end
		
	end
end