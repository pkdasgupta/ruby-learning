class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def new 
        @project = Project.new
    end

    def show
        begin
            @project = Project.find(params[:id])
            @task = Task.new
        rescue ActiveRecord::RecordNotFound
            redirect_to projects_path
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        if @project.update_attributes(project_params)
            redirect_to project_path(@project.id)
        else
            render action: "edit"
        end
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to projects_path, notice: "Cool..Project Successfully Registered ! :)"
        else
            render action: "new"
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to project_path, notice: "Details for Project : #{@project.name} Vanished ! :("
    end

    private

    def project_params
        params[:project].permit(:name, :client_id, :description, :start_date, :end_date, :status, category_ids: [])
    end

end
