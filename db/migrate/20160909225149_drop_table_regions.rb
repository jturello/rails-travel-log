class DropTableRegions < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :countries, :regions

    drop_table :regions
  end
end
