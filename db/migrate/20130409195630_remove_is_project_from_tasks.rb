class RemoveIsProjectFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :is_project
  end

  def down
    add_column :tasks, :is_project, :boolean
  end
end
