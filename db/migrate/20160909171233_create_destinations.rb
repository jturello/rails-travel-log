class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string  :name
      t.string  :blurb
      t.text    :description
      t.string  :image_url

      t.integer :country_id

      t.timestamps
    end
  end
end
