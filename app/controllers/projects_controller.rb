class ProjectsController < ApplicationController

before_action :set_project, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!


def index
    @project = Project.all
end

def show
end

def new
    @project = Project.new
end

def create
    @project = Project.new(project_params)
    if @project.save
        flash[:success] = 'The project was created'
        redirect_to @project
    else
        flash[:error] = 'The project was not created'
        render :new
    end
end

def edit
end

def update
    if @project.update_attributes(project_params)
        flash[:success] = 'The project has been updated'
        redirect_to @project
    else
        flash[:alert] = 'The project has not been updated'
        render :edit
    end
end

def destroy
    @project.tasks.destroy_all
    @project.destroy
    flash[:alert] = 'The project was deleted'
    redirect_to root_path
end

private 
def set_project
    @project = Project.find(params[:id])
end

def project_params
    params.require(:project).permit(:name,:user_id)
end
    
end