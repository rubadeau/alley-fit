class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :assessment_name
      t.date :assessment_date
      t.string :overhead_squat
      t.string :single_leg_squat
      t.decimal :right_hip_strength
      t.decimal :left_hip_strength
      t.string :shoulder_mobility
      t.string :right_glute_activation
      t.string :left_glute_activation
      t.decimal :plank
      t.decimal :right_plank
      t.decimal :left_plank
      t.string :leg_lowering
      t.string :push_up
      t.string :blood_pressure
      t.integer :weight
      t.string :height
      t.belongs_to :client

      t.timestamps null: false
    end
  end
end
