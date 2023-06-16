class AddUserIdToAdminContactMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_contact_messages, :user_id, :integer
    add_index  :admin_contact_messages, :user_id
  end
end
