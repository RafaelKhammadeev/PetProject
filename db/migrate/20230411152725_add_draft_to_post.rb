class AddDraftToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :status, :string, null: false, default: "Draft"
  end
end
