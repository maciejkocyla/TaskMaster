class HabitsController < ApplicationController

  before_filter :set_habit

  def new
    @habit = Habit.new
  end

  def create
    @habit = current_user.habits.build(params[:habit])
    if @habit.save
      redirect_to habits_path
      flash[:success] = "habit created!"
    else
      redirect_to new_habit_path
      flash[:error] = "something went wrong!"
    end
  end

  def destroy
    Habit.find(params[:id]).destroy
    flash[:success] = "habit deleted"
    redirect_to habits_path
  end

  def index
    @habits = current_user.habits
  end

  def show
    @habit    
  end

  def complete
    @habit.completed_days.push(Date.today)
    redirect_to habits_path
  end

  private

    def set_habit
      @habit = Habit.find(params[:id]) unless params[:id].nil?
    end
end
