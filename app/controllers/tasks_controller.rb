class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      redirect_to current_user
      flash[:success] = "challenge accepted"
    else
      redirect_to new_task_path
      flash[:error] = "invali data - task not created"
    end
  end

  def show
    @task = Task.find(params[:id])
    current_task(@task)
  end

  def index
  end
end
