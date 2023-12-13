class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.references :posts, null: :false
      t.references :comments, null: :false

      t.timestamps
    end
  end
end
