class Api::V1::PlayersController < Api::V1::BaseController
	
	def index
		@player = Player.all
		render json:{:status => true,:message=>"Success",:players =>@player}
	end

	def create
		
	end
end