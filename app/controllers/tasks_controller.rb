class TasksController < ApplicationController
    before_action :set_project
    before_action :set_task, except: [:create]
    before_action :authenticate_user!, except: [:index,:show]
    def create 
        @task = @project.tasks.create(task_params)
        if @task.save
            flash[:success] = 'The new task was created'
            redirect_to @project
        else
            flash[:error] = 'The task was not created'
            redirect_to @project
        end
    end
    def show
    end
    
    def update
        if @task.update_attributes(task_params)
            flash[:success] = 'The task was updated'
            redirect_to @project
        else
            flash[:error] = 'The task was not updated'
            render :edit
        end
    end

    def destroy
        @task = @project.tasks.find(params[:id])
        if @task.destroy
            flash[:success] = "Task was deleted"
        else
            flash[:error] = "Task could not be deleted"
        end
        redirect_to @project
    end

    def complete
        if @task.completed? != false
            @task.update_attribute(:complated_at, nil)
            @task.update_attribute(:status, false)
        else
            @task.update_attribute(:complated_at, Time.now)
            @task.update_attribute(:status, true)
        end
        
        redirect_to @project, notice: "Task status was changed!"
    end

    private
    
    def set_project
        @project = Project.find(params[:project_id])
    end

    def set_task
		@task = @project.tasks.find(params[:id])
	end

    def task_params
        params[:task].permit(:name, :status, :deadline, :priority)
    end
end
