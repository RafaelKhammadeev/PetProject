class ChangeStatusTypeInPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :status
    add_column :posts, :status, :integer, default: 0
  end
end
