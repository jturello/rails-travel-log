class Forecast < ActiveRecord::Base
  belongs_to :destination
  before_create :get_forecast


  validates :api_timestamp, :destination_id, presence: true

  private
  def get_forecast
    response = RestClient::Request.new(
      :method => :get,
      :url => 'https://api.darksky.net/forecast/ENV[DARKSKY_API_KEY]/37.8267,-122.4233'
      ).execute
  end
end
