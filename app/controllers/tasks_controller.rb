class TasksController < ApplicationController

#  before_filter :correct_user, only: [:edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(params[:task])
    if @task.date.nil?
      @task.date = Date.today
    end


    if @task.save
      Task.find_by_id(params[:task_id]).tasks.push(@task) unless params[:task_id].nil?
      current_user.tasks.push(@task)
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

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:success] = "task updated"
      redirect_to @project
    else 
      flash[:error] = "something is fucked up"
    end
  end

  def show
    @task = Task.find(params[:id])
    current_task(@task)
    store_location
  end

  def index

  end

  def complete
    @task = Task.find(params[:task_id])
    @task.toggle!(:completed)
    redirect_back_or(current_user)
  end

  private
 
    def correct_user
      if params[:id].nil?
        @task = Task.find(params[:task_id])
      else
        @task = Task.find(params[:id])
      end
      redirect_to(root_path(:current_user => current_user.id, :task_user => @task.user.id)) unless current_user == @task.user
    end

end
