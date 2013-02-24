class Relation < ActiveRecord::Base
  attr_accessible :project_id, :task_id

  belongs_to :task
  belongs_to :project, :class_name => "Task"
end
