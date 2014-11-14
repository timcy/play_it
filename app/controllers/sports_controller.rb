class SportsController < ApplicationController
	def index
		@sports=Sport.all
	end
	def new
		@sport=Sport.new
	end
	def show
		@player=Sport.find params[:id]
	end

	def create
		@sport=Sport.new(sport_params)
		if @sport.save
			redirect_to sports_path
		else
			redirect_to new_sport_path
		end
	end
	def edit
	end
	def update
	end
	def delete
	end
	private

# Never trust parameters from the scary internet, only allow the white list through.
def sport_params
  params.require(:sport).permit(:name,:sport_type,:player_id)
end
end
