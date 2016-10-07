class ForecastsController < ApplicationController

  def new
    @forecast = Forecast.new
    @destination = Destination.find(params[:destination_id])
    @country = Country.find(params[:country_id])
  end

  def create
    #binding.pry
    @destination = Destination.find(params[:destination_id])
    @forecast = @destination.forecasts.new(forecast_params)
    #binding.pry
    if @forecast.save
      flash[:notice] = "Forecast data was saved successfully!"
      redirect_to country_destination_path @forecast.destination.country, @forecast.destination
    else
      # #binding.pry
      redirect_to new_country_destination_forecast_path(params[:country_id], params[:destination_id])
    end
  end


  private
  def forecast_params
    params.require(:forecast).permit(:destination_id, :latitude, :longitude)
  end

end
