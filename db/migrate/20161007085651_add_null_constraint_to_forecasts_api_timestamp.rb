class AddNullConstraintToForecastsApiTimestamp < ActiveRecord::Migration[5.0]
  def change
    change_column_null :forecasts, :api_timestamp, false
  end
end
