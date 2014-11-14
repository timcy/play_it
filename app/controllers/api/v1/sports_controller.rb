class Api::V1::SportsController < Api::V1::BaseController

	def index
		puts "the header#{request.headers['token']}"
		@sports = Sport.all
		render json:{:status=> true,:sports=>@sports}
	end

	def create
		sport = Sport.create(sport_params)
		if sport.valid?
			render json:{:status=>true,:message=> "Sport Created Successfully",:sport=>sport}
		else
			render json:{:status=>false,:error => sport.errors.full_messages}	
		end
	end

	private
	def sport_params
		params.require(:sport).permit(:name,:sport_type)
	end
end
