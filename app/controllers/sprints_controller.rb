class SprintsController < ApplicationController
  before_action :find_project
  before_action :find_sprint, only: [:destroy, :edit, :update]
  
  def index
  end

  def create
    @sprint = @project.sprints.create(sprint_params)
    @sprint.user_id = current_user.id
    if @sprint.save
      respond_to do |format|
        format.html{redirect_to project_path(@project)}
        format.js#render sprints/create.js.erb
      end
    else
      render 'new'
    end
  end
  
  def edit
    @close_sprint = params[:close_sprint]
    if @close_sprint#change state sprint to closed if you click on closed
      @sprint.state = 1
    end
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
    @sprints = Sprint.all
    @sprint = Sprint.find(params[:id])
    @tasks = @sprint.tasks
   
  end

  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy
    redirect_to project_path(@project)
    flash[:notice] = "Successfully deleted project!"
  end  

  private

  def sprint_params
    params.require(:sprint).permit(:name, :state, :begin_sprint, :end_sprint, :hours, :number_tasks, :num_compromised_points, :completed_tasks, :completed_points, :defects_found, :owner_sprint)
  end

  def find_project
    @project = Project.find(params[:project_id])    
  end

  def find_sprint
    @sprint = @project.sprints.find(params[:id])    
  end
end


