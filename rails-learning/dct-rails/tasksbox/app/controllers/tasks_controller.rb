class TasksController < ApplicationController

	before_filter :authenticate_user!
	
	def index
		@project = Project.find(params[:project_id])
	end

	def show
		@project = Project.find(params[:project_id])
		@task = Task.find(params[:id])
	end

	def destroy
		@project = Project.find(params[:project_id])
		@task = Task.find(params[:id])
		@task.destroy

		redirect_to project_path(@project)
	end

	def mark_as_complete
		task = Task.find(params[:task_id])
		task.update_attributes(is_completed: true)
		redirect_to :back
	end

	def mark_as_incomplete
		task = Task.find(params[:task_id])
		task.update_attributes(is_completed: false)
		redirect_to :back
	end

	def edit
		@project = Project.find(params[:project_id])
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id), notice: "Added Task to Project Successfully!!"
			#params[:task][:project_id] : to be used while working with json
		end
	end

	private
	def task_params
		params[:task].permit(:title, :due_date, :project_id, :is_completed)
	end
end
