class AddBmiToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :bmi, :string
    add_column :assessments, :heart_rate, :string
    add_column :assessments, :body_fat_percentage, :string
  end
end
