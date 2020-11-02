class TasksController < ApplicationController
    before_action :set_project
    before_action :set_task, except: [:create]
    def create 
        @task = @project.tasks.create(task_params)
        if @task.save
            redirect_to @project, success: 'The task was created'
        else
            redirect_to @project, danger: 'The task was not created'
        end
    end
    def show
    end
    
    def update
        if @task.update_attributes(task_params)
            redirect_to @project, success: 'The task has been updated'
        else
            render :edit , danger: 'The task has not been updated'
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
