class Client < ActiveRecord::Base

  validates :name, presence: true

  has_many :workouts, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :goals, dependent: :destroy

end
