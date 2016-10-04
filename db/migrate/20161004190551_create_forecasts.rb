class CreateForecasts < ActiveRecord::Migration[5.0]
  def change
    create_table :forecasts do |t|
      t.integer     :api_timestamp, :index
      t.string      :timezone
      t.string      :date
      t.text        :summary
      t.string      :icon
      t.decimal     :temp
      t.decimal     :humidity
      t.decimal     :windspeed
      t.decimal     :precip_probability
      t.text        :summary_for_week
      t.integer     :destination_id

      t.timestamps
    end

    add_foreign_key :forecasts, :destinations

  end
end
