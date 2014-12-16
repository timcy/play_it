class Api::V1::TasksController < Api::V1::BaseController
		doorkeeper_for :all
     respond_to :json
	def index
		respond_with api_user.tasks
		# @tasks = current_user.tasks
	end

	def create
		@task = Task.new task_params
		@task.user = api_user
		if @task.save!
			render json:{:notice => "task created successfully"}
		else
			render json:{:notice => "Error in task"}
			
		end

	end
	private
	def task_params
		puts "the params are #{params}"
		params.require(:task).permit(:name)
	end
end
