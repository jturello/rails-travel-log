class AddRegionToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :region, :string
  end
end
