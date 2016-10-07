class AddLatLongToForecast < ActiveRecord::Migration[5.0]
  def change
    add_column :forecasts, :latitude, :decimal, :precision => 10, :scale => 6, :null => false
    add_column :forecasts, :longitude, :decimal, :precision => 10, :scale => 6, :null => false
  end
end
