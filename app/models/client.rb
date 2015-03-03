class Client < ActiveRecord::Base

  has_many :workouts
  has_many :assessments

end
