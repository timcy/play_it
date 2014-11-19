class SportsController < ApplicationController
	before_filter :login_required
    before_filter :admin_required,only: [:sport_manage_form]
	def index
		@sports=Sport.all
	end
	def new
		@sport=Sport.new
		Sport.reset_column_information
		Sport.column_names.delete("created_at")
		Sport.column_names.delete("id")
		Sport.column_names.delete("player_id")
		Sport.column_names.delete("updated_at")
		@fields=Sport.column_names
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


	def sport_manage_form
		@sport_fields=Sport.column_names
		if request.post?
			require 'rake'
			name=params[:field][:name]
			type=params[:field][:type]
			`rails g migration add_#{name}_to_sports #{name}:#{type}`
			`rake db:migrate`					
			Sport.reset_column_information
			@sport_fields=Sport.column_names
			flash[:notice]="The field added successfully"
		end
	end
	private

# Never trust parameters from the scary internet, only allow the white list through.
def sport_params
  params.require(:sport).permit!
end
end
