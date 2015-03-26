class Workout < ActiveRecord::Base

  validates :date, presence: true
  validates :time, presence: true

  belongs_to :client

end
