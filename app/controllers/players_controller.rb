class PlayersController < ApplicationController

	def index
		@players=Player.all
	end
	def new
		@player=Player.new
		@sports=Sport.all
		@player.build_user
	end
	def show
		@player=Player.find params[:id]
	end

	def create
		@player=Player.new player_params
		@player.sports << Sport.find(params[:sports]) unless params[:sports].empty?
		if @player.save
			redirect_to players_path
		else
			redirect_to new_player_path
		end
	end
	def edit
	end
	def update
	end
	def delete
	end

private
def player_params
  params.require(:player).permit!
end

end
