class Relation < ActiveRecord::Base
  attr_accessible :project_id, :task_id

  belongs_to :task, dependent: :destroy
  belongs_to :project, :class_name => "Task", dependent: :destroy
end
