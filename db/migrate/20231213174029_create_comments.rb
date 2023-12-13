class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text, null: :false
      t.references :users 
      t.references :posts, null: :false

      t.timestamps
    end
  end
end
