class RenameColumnToCountriesDescripton < ActiveRecord::Migration[5.0]
  def change
    rename_column :countries, :destination, :description
  end
end
