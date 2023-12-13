class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.references :post, null: false
      t.references :comment, null: false

      t.timestamps
    end
  end
end
