class Api::V1::PlayersController < Api::V1::BaseController
	
	def index
		@player = Player.all
		render json:{:status => true,:message=>"Success",:players =>@player}
	end

	def create
		@player=Player.new player_params
		@player.sports << Sport.find(params[:sports]) unless params[:sports].empty?
		if @player.save
			render json:{:status=> true,:message=>"Player created successfully"}
		else
			render json:{:status=> false,:errors=>@player.errors.full_messages}
		end
	end

	private
	def player_params
		params.require(:player).permit!
	end 
end