class CreateAdminContactMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_contact_messages do |t|
      t.string "title"
      t.string "message"

      t.timestamps
    end
  end
end
