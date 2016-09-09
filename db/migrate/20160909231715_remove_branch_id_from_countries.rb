class RemoveBranchIdFromCountries < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :region_id, :integer
  end
end
