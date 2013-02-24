class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :project_id
      t.integer :task_id

      t.timestamps
    end
  end
end
