class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :countries, :regions
    add_foreign_key :destinations, :countries

    add_index :countries, :region_id
    add_index :destinations, :country_id

  end
end
