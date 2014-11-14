class PlayersController < ApplicationController

	def index
		@players=Player.all
	end
	def new
		@player=Player.new
	end
	def show
		@player=Player.find params[:id]
	end

	def create
		@player=Player.new params[:player]
		if player.save
			redirect_to player_path(@player)
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
end
