class ProjectsController < ApplicationController
   before_action :find_project, only: [:edit, :update, :show, :delete]
   before_action :authenticate_user!

  def index
    @user = current_user
    @projects =  @user.projects
  end

  def new
    @project = Project.new
    
  end

  def create
  @project = Project.new(project_params)
  @project.user = current_user
    if @project.save
      redirect_to projects_path(@project)
    else
      render :new
      flash[:alert] = "Error creating new project!"
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
 
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to projects_path(@project)
      flash[:notice] = "Successfully updated project!"
    else
      render :edit
      flash[:alert] = "Error updating project!"
    end
  end
 
  def show
    @sprints = Sprint.where(project_id: @project).order("created_at ASC")
  end
 
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Successfully deleted project!"
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :owner, :state, :number_sprints, :details, :sprints)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end

