class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string  :name
      t.string  :blurb
      t.text    :destination
      t.string  :language
      t.string  :image_url
      
      t.integer :region_id

      t.timestamps
    end
  end
end
