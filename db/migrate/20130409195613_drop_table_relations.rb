class DropTableRelations < ActiveRecord::Migration
  def up
    drop_table :relations
  end

  def down
    create_table "relations", :force => true do |t|
      t.integer  "project_id"
      t.integer  "task_id"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
