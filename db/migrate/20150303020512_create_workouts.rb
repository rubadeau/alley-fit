class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.date :date
      t.time :time
      t.text :workout
      t.text :comments

      t.timestamps null: false
    end
  end
end
