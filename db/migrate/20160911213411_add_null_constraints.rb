class AddNullConstraints < ActiveRecord::Migration[5.0]
  def change
    change_column_null :countries, :name, false
    change_column_null :countries, :blurb, false
    change_column_null :countries, :description, false

    change_column_null :destinations, :name, false
    change_column_null :destinations, :blurb, false
    change_column_null :destinations, :description, false

  end
end
