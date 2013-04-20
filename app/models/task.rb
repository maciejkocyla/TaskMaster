class Task < ActiveRecord::Base
  attr_accessible :completed, :content, :date, :name, :task_id

  belongs_to :user
  belongs_to :project
  belongs_to :task
  has_many :tasks

  #validates :user_id, presence: true
  validates :name, presence: true

  def for_today?
    self.date.today? unless self.date.nil?
  end

  


end
