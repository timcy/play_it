class PlayersController < ApplicationController
	before_filter :login_required
	def index
		@players=Player.all
	end
	def new
		@player=Player.new
		@sports=Sport.all
		@player.build_user
		Player.reset_column_information
		Player.column_names.delete("created_at")
		Player.column_names.delete("id")
		Player.column_names.delete("updated_at")
		@fields=Player.column_names
	end
	def show
		@player=Player.find params[:id]
	end

	def create
		@player=Player.new player_params
		@player.sports << Sport.find(params[:sports]) unless params[:sports].blank?
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
		if @player.destroy
		   flash[:notice]="The record was successfully deleted."
		   redirect_to players_path
		end
	end

	def my_sports
		@sports=current_user.player.sports
	end

	def player_manage_form
		@player_fields=Player.column_names
		if request.post?
			require 'rake'
			name=params[:field][:name]
			type=params[:field][:type]
			ActiveRecord::Migration.add_column(Player, name, type)
			Player.reset_column_information
			@player_fields=Player.column_names
			%x[rake db:schema:dump]			
			flash[:notice]="The field added successfully"
		end
	end

private
def player_params
  params.require(:player).permit!
end

end
