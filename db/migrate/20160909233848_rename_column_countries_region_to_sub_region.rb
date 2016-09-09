class RenameColumnCountriesRegionToSubRegion < ActiveRecord::Migration[5.0]
  def change
    rename_column :countries, :region, :sub_region
  end
end
