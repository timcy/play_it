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
		puts sport_params
		
		@sport=Sport.new(sport_params)
		if @sport.save
			redirect_to sport_path(@sport)
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
  params.require(:sport).permit(:name,:type,:player_id)
end
end
