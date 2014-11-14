class PlayersController < ApplicationController
	before_filter :login_required
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
		@player=Player.find params[:id]
		@sports=Sport.all		
	end
	def update
		@player=Player.find params[:id]
		puts "before updating the sports are#{@player.sports}"
		@player.sports << Sport.find(params[:sports]) unless params[:sports].empty?
		puts "after settingthe sports rge#{@player.sports}"
		if @player.update_attributes(player_params)
		flash[:notice]="The record was successfully updated."
	else
		puts "i am in update error"
		end
       redirect_to players_path

	end
	def destroy
		@player=Player.find params[:id]
		if @player.delete
		   flash[:notice]="The record was successfully deleted."
		   redirect_to players_path
		end
	end

	def my_sports
		@sports=current_user.player.sports

	end

private
def player_params
  params.require(:player).permit!
end

end
