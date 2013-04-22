class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :name
      t.integer :user_id
      t.text :content
      t.date :completed_days

      t.timestamps
    end
  end
end
