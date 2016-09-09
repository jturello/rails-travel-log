class RemoveIndexCountriesOnRegionId < ActiveRecord::Migration[5.0]
  def change
    remove_index :countries, :column => :region_id
  end
end
