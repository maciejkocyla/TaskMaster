class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :content
      t.boolean :completed, :default => false
      t.datetime :date

      t.timestamps
    end
  end
end
