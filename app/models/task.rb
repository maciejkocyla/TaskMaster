class Task < ActiveRecord::Base
  attr_accessible :completed, :content, :date, :name
  belongs_to :user
  has_many :relations
  has_one :project, :through => :relations
  
  validates :user_id, presence: true
  validates :name, presence: true
end
