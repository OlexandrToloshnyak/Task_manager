class ProjectsController < ApplicationController

before_action :set_project, only: [:show, :edit, :update, :destroy]

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
        redirect_to @project, success: 'The project was created'
    else
        render :new, danger: 'The project was not created'
    end
end

def edit
end

def update
    if @project.update_attributes(project_params)
        redirect_to @project, success: 'The project has been updated'
    else
        render :edit, danger: 'The project has not been updated'
    end
end

def destroy
    @project.destroy
    redirect_to posts_path, warning: 'The project has been deleted'
end

private 
def set_project
    @project = Project.find(params[:id])
end

def project_params
    params.require(:project).permit(:name)
end

end