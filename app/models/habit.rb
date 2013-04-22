class Habit < ActiveRecord::Base
  attr_accessible :content, :name, :user_id, :completed_days

  belongs_to :user

  serialize :completed_days
end
