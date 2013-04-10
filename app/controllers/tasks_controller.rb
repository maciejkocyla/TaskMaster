class TasksController < ApplicationController

  before_filter :correct_user, only: [:edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(params[:task])
    if @task.save
      flash[:success] = "challenge accepted"
      redirect_to @project
    else
      redirect_to new_project_task_path
      flash[:error] = "invali data - task not created #{params[:task]}"
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Project removed"
    redirect_to current_user
  end

  def show
    @task = Task.find(params[:id])
    current_task(@task)
    store_location
  end

  def index

  end

  def complete
    @task = Task.find(params[:task])
    @task.toggle!(:completed)
    redirect_back_or(current_user)
  end

  private
 
    def correct_user
      @task = Task.find(params[:id])
      redirect_to(root_path) unless @current_user == @task.user
    end

end
