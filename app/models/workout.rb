class Workout < ActiveRecord::Base

  validates :date, presence: true

  belongs_to :client

end
