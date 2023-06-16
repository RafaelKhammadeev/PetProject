class AddUserIdToContactMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :contact_messages, :user_id, :integer
    add_index  :contact_messages, :user_id
  end
end
