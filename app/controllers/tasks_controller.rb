class TasksController < ApplicationController
  def new
  end

  def show
    @task = Task.find(params[:id])
    current_task(@task)
  end

  def index
  end
end
