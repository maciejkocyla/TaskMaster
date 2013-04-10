class Project < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :tasks
  belongs_to :user
end
