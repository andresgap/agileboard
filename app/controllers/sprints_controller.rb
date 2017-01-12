class SprintsController < ApplicationController
  before_action :find_project
  before_action :find_sprint, only: [:destroy, :edit, :update]
  def index
  end

  def create
    @sprint = @project.sprints.create(sprint_params)
    @sprint.user_id = current_user.id
    if @sprint.save
      redirect_to project_path(find_project)
    else
      render 'new'
    end
  end
  
  def edit
   

  end

  def update
    
     if @sprint.update(sprint_params)
      redirect_to project_path(find_project)
      flash[:notice] = "Successfully updated sprint!"
    else
      render :edit
      flash[:alert] = "Error updating sprint!"
    end
  end


  def show
    @sprint = Sprint.find(params[:id])
  end

  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy
    redirect_to projects_path(@project)
    flash[:notice] = "Successfully deleted project!"
  end  

  private

  def sprint_params
    params.require(:sprint).permit(:name, :state, :begin_sprint, :end_sprint, :hours, :number_tasks, :num_compromised_points)
  end

  def find_project
    @project = Project.find(params[:project_id])    
  end
  def find_sprint
    @sprint = @project.sprints.find(params[:id])    
  end
end

