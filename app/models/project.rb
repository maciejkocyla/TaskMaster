class Project < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :tasks, dependent: :destroy
  belongs_to :user

  def completed_tasks
    completed_tasks = []
    self.tasks.each do |task|
    completed_task.push(task) if task.completed?;
    end
  end
end
