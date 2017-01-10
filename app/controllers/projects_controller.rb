class ProjectsController < ApplicationController
   before_action :find_project, only: [:edit, :update, :show, :delete]
   before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
  @project = Project.new(project_params)
  @project.user = current_user
    if @project.save
      redirect_to projects_index_path(@project)
    else
      render :new
      flash[:alert] = "Error creating new place!"
    end
  end
  
  def edit
  end
 
  def update
    if @project.update_attributes(project_params)
      redirect_to projects_index_path(@project)
      flash[:notice] = "Successfully updated place!"
    else
      render :edit
      flash[:alert] = "Error updating place!"
    end
  end

 
  def show
    #@comments = Comment.where(place_id: @place).order("created_at DESC")
  end

 
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Successfully deleted project!"
    redirect_to projects_index_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :owner, :state, :number_sprints, :details, :sprints)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
