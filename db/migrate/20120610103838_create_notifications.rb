class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :message
      t.boolean :is_read, :default => false
      t.timestamps
    end

    add_index :notifications, :user_id
  end
end
