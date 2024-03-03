class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.references :user 
      t.references :post, null: false

      t.timestamps
    end
  end
end
