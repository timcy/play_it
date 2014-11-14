class SportsController < ApplicationController
	before_filter :login_required

	def index
		@sports=Sport.all
	end
	def new
		@sport=Sport.new
	end
	def show
		@sport=Sport.find params[:id]
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
		@sport=Sport.find params[:id]
		render "new"
	end
	def update
		@sport=Sport.find params[:id]
		if @sport.update_attributes(sport_params)
		flash[:notice]="The record was successfully updated"
		end
       redirect_to sports_path

	end
	def destroy
		@sport=Sport.find params[:id]
		if @sport.delete
		   flash[:notice]="The record is deleted successfully"
		   redirect_to sports_path
		end
	end
	private

# Never trust parameters from the scary internet, only allow the white list through.
def sport_params
  params.require(:sport).permit(:name,:sport_type,:player_id)
end
end
