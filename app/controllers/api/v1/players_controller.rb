class Api::V1::PlayersController < Api::V1::BaseController
	before_filter :verify_token, :only => [:update,:destroy]
	# include VerifyAuthToken
	def index
		@player = Player.all
		render json:{:status => true,:message=>"Success",:players =>@player}
	end

	def create
		puts "email is #{params[:player][:user_attributes][:email]}"
		@player=Player.new player_params
		@player.sports << Sport.find(params[:sports]) unless params[:sports].blank?
		if @player.save
			gb = Gibbon::Api.new
			list = gb.lists.list({:filters => {:list_name => "NetSolutions"}})
			gb.lists.subscribe({:id => list["data"].first["id"], :email => {:email => params[:player][:user_attributes][:email]}, :merge_vars => {:FNAME => params[:player][:first_name, :LNAME => params[:player][:last_name]}, :double_optin => false})
			render action: :create
		else
			render json:{:status=> false,:errors=>@player.errors.full_messages}
		end
	end

	def update
		@player=Player.find params[:id]
		@player.sports << Sport.find(params[:sports]) unless params[:sports].blank?
		if @player.update_attributes(player_params)
			render json:{:status=>true,:message=>"Player Updated successfully"}
		else
			render json:{:status=>false,:errors => @player.errors.full_messages}
		end
    end

	def destroy
		player = Player.find params[:id]
		if player.destroy
			render json:{:status=>true,:message=>"Player Deleted Sussessfully"}
		else
			render json:{:status=>false,:message=>"Unable to Delete Player"}
		end
	end

	private

	def player_params
		params.require(:player).permit!
	end 

	def verify_token
		@player = Player.find(params[:id])
		raise  if @player.user.access_token != request.headers['token']
      	rescue Exception =>e
        	render json:{:status => false,:status_code=> 4001, :message => "Auth token not verified"}

	end
end