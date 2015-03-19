class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :client
      t.datetime :target_date
      t.string :goal_name
      t.text :goals
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
