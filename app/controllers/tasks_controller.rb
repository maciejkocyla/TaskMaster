class TasksController < ApplicationController
  def new
    @task = Task.new
    @task.relations.build
  end

  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      flash[:success] = "challenge accepted"
      redirect_to current_user
    else
      redirect_to new_task_path
      flash[:error] = "invali data - task not created"
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
    @task = Task.find(params[:task])
    @task.toggle!(:completed)
    redirect_back_or(current_user)
  end
end
