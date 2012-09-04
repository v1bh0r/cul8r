class AddImageUrlToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :image_url, :string

  end
end
