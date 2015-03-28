class Client < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true

  has_many :workouts, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :food_logs, dependent: :destroy

end
