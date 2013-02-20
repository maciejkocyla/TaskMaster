class TasksController < ApplicationController
  def new
  end

  def show
    @task = Task.find(params[:id])
  end

  def index
  end
end
