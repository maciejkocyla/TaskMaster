class AddIsProjectToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_project, :boolean
  end
end
