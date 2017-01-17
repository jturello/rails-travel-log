class Forecast < ActiveRecord::Base
  belongs_to :destination

  before_create :get_forecast

  validates :destination_id, :latitude, :longitude, presence: true

  private
  def get_forecast
    begin
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{self.latitude},#{self.longitude}?exclude=minutely,hourly,flags"
        ).execute  # 37.8267,-122.4233
        # binding.pry
      rescue RestClient::BadRequest => error
        forecast = JSON.parse(error.response)['forecast']
        errors.add(:base, forecast)
        throw(:abort)
    end

    parsed_response = JSON.parse(response)
    self.timezone = parsed_response['timezone']
    self.api_timestamp = parsed_response['currently']['time']
    self.date = response.headers[:date]
    self.summary = parsed_response['currently']['summary']
    self.icon = parsed_response['currently']['icon']
    self.temp = parsed_response['currently']['temperature']
    self.humidity = parsed_response['currently']['humidity']
    self.windspeed = parsed_response['currently']['windSpeed']
    self.precip_probability = parsed_response['currently']['precipProbability']
    self.summary_for_week = parsed_response['daily']['summary']

  end
end
