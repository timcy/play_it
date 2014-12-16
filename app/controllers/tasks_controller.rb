class TasksController < ApplicationController
	before_filter :login_required
	
	def index
		@tasks = Task.all
		render json: @tasks
	end

	def new
		@tasks = current_user.tasks
		@task = Task.new
	end

	def create
		@task = Task.new task_params
		@task.user = current_user
		if @task.save!
			flash[:notice] = "task created successfully"
			render "create"
		else
			flash[:notice] = "Error in task"
			redirect_to new_task_path
		end

	end
	def update
		@task = Task.find(params[:id])
		if @task.deleted
			@task.update_attributes(:deleted=>false)
			render json: @task
		else
			@task.update_attributes(:deleted=>true)
			render json: @task
		end
	end

	def update_task
		puts "the params are #{params}"
		@task = Task.find(params[:id])
		if @task
			@task.update_attributes(:name=>params[:name])
			render json: @task
		else
			
			render json: {:meassage =>"error"}
		end
	end

	private
	def task_params
		params.require(:task).permit(:name)
	end
end
