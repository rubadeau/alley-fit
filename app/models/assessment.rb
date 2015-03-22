class Assessment < ActiveRecord::Base

  validates :assessment_name, presence: true

  belongs_to :client

end
