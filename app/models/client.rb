class Client < ActiveRecord::Base

  has_many :workouts
  has_many :assessments
  has_many :goals

end
