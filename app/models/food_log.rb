class FoodLog < ActiveRecord::Base

  validates :date, presence: true

  belongs_to :client

end
