class CreateFoodLogs < ActiveRecord::Migration
  def change
    create_table :food_logs do |t|
      t.datetime :date
      t.string :breakfast
      t.string :mid_morning_snack
      t.string :lunch
      t.string :afternoon_snack
      t.string :dinner
      t.string :after_dinner
      t.string :drinks
      t.text :client_coments
      t.text :trainer_feedback

      t.timestamps
    end
  end
end
