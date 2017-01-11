class SprintsController < ApplicationController
   before_action :find_sprint, only: [:edit, :update, :show, :delete]
   before_action :authenticate_user!

  def index
    @sprints = Sprint.all
  end

  def new
    @sprint = Sprint.new
  end

  def create
  @sprint = Sprint.new(sprint_params)
  @sprint.user = current_user
    if @sprint.save
      redirect_to sprints_index_path(@sprint)
    else
      render :new
      flash[:alert] = "Error creating new project!"
    end
  end
  
  def edit
    @sprint = Sprint.find(params[:id])
  end
 
  def update
    @sprint = Sprint.find(params[:id])
    if @sprint.update_attributes(sprint_params)
      redirect_to sprints_index_path(@sprint)
      flash[:notice] = "Successfully updated project!"
    else
      render :edit
      flash[:alert] = "Error updating project!"
    end
  end
 
  def show
    #@project = @user.project
    #@comments = Comment.where(project_id: @project).order("created_at DESC")
  end
 
  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy
    flash[:notice] = "Successfully deleted project!"
    redirect_to sprints_index_path
  end

  private

  def sprint_params
    params.require(:sprint).permit(:begin_sprint, :end_sprint, :hours, :number_tasks, :num_compromised_points, :state, :completed_tasks, :completed_points, :defects_found, :owner_sprint)
  end

  def find_sprint
    @sprint = Sprint.find(params[:id])
  end
end
