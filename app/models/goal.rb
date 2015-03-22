class Goal < ActiveRecord::Base

  validates :goal_name, presence: true

  belongs_to :client


end
