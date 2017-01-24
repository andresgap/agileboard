class TasksController < ApplicationController
  #before_action :find_project
  before_action :find_task ,only: [:edit, :update, :show, :delete]
  before_action :find_sprint, only: [:edit, :update, :destroy]
  
  def index
    @sprint = Sprint.find(params[:sprint_id])
    #@task = Task.find(params[:id])
    @tasks =  @sprint.tasks
  end

  def new
    @task = Task.new
    @sprint = Sprint.find(params[:sprint_id])
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.find(params[:sprint_id])
    @task = @sprint.tasks.create(task_params)
    @task.user_id = current_user.id
    @task.project_id = @project.id
    if @task.save
    	redirect_to project_sprint_tasks_path(@task)
    else
      render 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.find(params[:sprint_id])
  end

  def update
    if @task.update(task_params)
      redirect_to project_sprint_task_path(@task)
      flash[:notice] = "Successfully updated task!"
    else
      render :edit
      flash[:alert] = "Error updating task!"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_sprint_task_path(@sprint)
    flash[:notice] = "Successfully deleted task!"
  end 

  def change_stage
    task_state = params[:state_task]
    container_stage = params[:container_stage]

    puts task_state.inspect
    @sprint = Sprint.find(params[:sprint_id])
    @task = @sprint.tasks.find(params[:id])
    if container_stage == '3'
      @task.update_attributes(:state_task => task_state, :done_time => Time.now)
    else
      @task.update_attributes(:state_task => task_state, :done_time => 0)
    end
  end 

  private

  def task_params
    params.require(:task).permit(:name, :type_task, :user_id, :project_id,:sprint_id, :dev_start_time, :dev_end_time, :state_task, :to_do_start_time, :to_do_end_time, :done_time)
  end

  def find_project
    @project = Project.find(params[:project_id])    
  end

  def find_sprint
    @sprint = Sprint.find(params[:sprint_id])    
  end	

  def find_task
  	@task = Task.find(params[:id])    
  end
end