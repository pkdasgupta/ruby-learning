class ProjectsController < ApplicationController
    
    before_filter :authenticate_user! #except: [:index]
    
    def index
        @projects = current_user.is_admin ? Project.all : current_user.projects
    end

    def new 
        @project = Project.new
    end

    def show
        begin
            @project = current_user.is_admin ? Project.find(params[:id]) : current_user.projects.find(params[:id])
            @task = Task.new
        rescue ActiveRecord::RecordNotFound
            redirect_to projects_path, notice: "Oops! Project Unavailable !!"
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
        @project.user_id = current_user.id
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
