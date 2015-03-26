class ChangeMultAssessmentColumnsToString < ActiveRecord::Migration
  def change
    change_column :assessments, :right_hip_strength, :string
    change_column :assessments, :left_hip_strength, :string
    change_column :assessments, :plank, :string
    change_column :assessments, :right_plank, :string
    change_column :assessments, :left_plank, :string

  end
end
