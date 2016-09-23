class AddNotNullContraintsToPosts < ActiveRecord::Migration[5.0]
  def change

    change_column_null :posts, :user_id, false
    change_column_null :posts, :content, false

  end
end
