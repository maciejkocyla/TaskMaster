class RemoveProjectFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :project
  end

  def down
    add_column :tasks, :project, :boolean
  end
end
