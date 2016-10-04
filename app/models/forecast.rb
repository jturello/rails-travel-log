class Forecast < ActiveRecord::Base
  belongs_to :destination

  validates :api_timestamp, :destination_id, presence: true
end
