class AddUnsubscribedAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :unsubscribed_emails_at, :datetime

  end
end
