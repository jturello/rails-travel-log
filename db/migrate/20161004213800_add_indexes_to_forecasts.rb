class AddIndexesToForecasts < ActiveRecord::Migration[5.0]
  def change
    add_index :forecasts, :api_timestamp
    add_index :forecasts, :destination_id
  end
end
