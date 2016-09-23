class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text    :content
      t.integer :user_id
      t.belongs_to :commentable, polymorphic: true

      t.timestamps
    end
    add_index :posts, [:commentable_id, :commentable_type]
  end
end
