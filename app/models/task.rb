class Task < ActiveRecord::Base
  attr_accessible :completed, :content, :date, :name, :is_project, :relations_attributes
  belongs_to :user
  has_many :relations, dependent: :destroy
  has_many :projects, :through => :relations, dependent: :destroy 
  
  accepts_nested_attributes_for :relations
  
  validates :user_id, presence: true
  validates :name, presence: true
end
