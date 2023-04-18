class ChangeTextForDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :text, :description
    change_column_null :posts, :description, true
  end
end
