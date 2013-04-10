class ProjectsController < ApplicationController

  before_filter :correct_user, only: [:edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:success] = "challenge accepted"
      redirect_to current_user
    else
      redirect_to new_project_path
      flash[:error] = "invali data - project not created"
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project removed"
    redirect_to current_user
  end

  def show
    @project = Project.find(params[:id])
    set_current_project(@project)
    store_location
  end

  def index

  end

  def complete
    @project = Project.find(params[:project])
    @project.toggle!(:completed)
    redirect_back_or(current_user)
  end

  private
 
    def correct_user
      @project = Project.find(params[:id])
      redirect_to(root_path) unless @current_user == @project.user
    end

end
