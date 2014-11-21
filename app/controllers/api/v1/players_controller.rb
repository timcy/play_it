class Api::V1::PlayersController < Api::V1::BaseController
	
	before_filter :player, :only =>[:update,:destroy]

	def index
		respond_with(Player.all)
	end

	def create
		@player=Player.new player_params
		@player.sports << Sport.find(params[:sports]) unless params[:sports].blank?
		if @player.save
			gb = Gibbon::API.new
			list = gb.lists.list({:filters => {:list_name => "NetSolutions"}})
			gb.lists.subscribe({:id => list["data"].first["id"], :email => {:email => params[:player][:user_attributes][:email]}, :merge_vars => {:FNAME => params[:player][:first_name],:LNAME => params[:player][:last_name], :double_optin => false}})
			current_req.update_attributes(:response => "200 ok")
			render action: :create
		else
			current_req.update_attributes(:response => "400 failed")
			render json:{:status=> false,:errors=>@player.errors.full_messages}
		end
	end

	def update
		@player.sports << Sport.find(params[:sports]) unless params[:sports].blank?
		if @player.update_attributes(player_params)
			current_req.update_attributes(:response => "200 ok")
			render json:{:status=>true,:message=>"Player Updated successfully"}
		else
			current_req.update_attributes(:response => "400 failed")
			render json:{:status=>false,:errors => @player.errors.full_messages}
		end
    end

	def destroy
		if @player.destroy
			current_req.update_attributes(:response => "200 ok")
			render json:{:status=>true,:message=>"Player Deleted Sussessfully"}
		else
			current_req.update_attributes(:response => "400 failed")
			render json:{:status=>false,:message=>"Unable to Delete Player"}
		end
	end

	private

	def player_params
		params.require(:player).permit!
	end

	def player
		@player = Player.find(params[:id])
		rescue ActiveRecord::RecordNotFound
  			render json: {:status=> 404 ,:error => "Record Not Found"}
	end
end