class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.string  :name
      t.string  :blurb
      t.text    :description
      t.string  :image_url

      t.timestamps
    end
  end
end
