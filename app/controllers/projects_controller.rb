class ProjectsController < ApplicationController

#  before_filter :correct_user, only: [:edit, :update, :destroy]
  before_filter :set_project

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
    @project
    store_location
  end

  def index
    @projects = current_user.projects
  end

  def complete
    @project.toggle!(:completed)
    redirect_back_or(current_user)
  end

  private
 
    
    def set_project
      if params[:project_id].nil? && params[:id].nil?
        @project = nil
      elsif params[:project_id].nil? && !params[:id].nil?
        @project = Project.find(params[:id])
      else
        @project = Project.find(params[:project_id])
      end
    end

    def correct_user
      redirect_to(root_path) unless current_user == @project.user
    end

end
