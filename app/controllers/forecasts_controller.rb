class ForecastsController < ApplicationController

  def new
    @forecast = Forecast.new
    @destination = Destination.find(params[:destination_id])
    @country = Country.find(@destination.country.id)
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @forecast = @destination.forecasts.new(forecast_params)
    if @forecast.save
      flash[:notice] = "Forecast data was fetched and saved successfully!"
      redirect_to country_destination_path @forecast.destination.country, @forecast.destination
    else
      if @forecast.errors.count == 1
        err = @forecast.errors.first
        flash[:alert] = "Forecast fetch failed with error #{err.join(" ")}. Try again!"
      else
        flash[:alert] = "Forecast fetch failed. Try again!"
      end
      redirect_to new_destination_forecast_path(params[:destination_id])
    end
  end


  private
  def forecast_params
    params.require(:forecast).permit(:destination_id, :latitude, :longitude)
  end

end
