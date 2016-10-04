class RemoveIndexFromForecasts < ActiveRecord::Migration[5.0]
  def change
    remove_column :forecasts, :index, :integer
  end
end
