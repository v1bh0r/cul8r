class CreateSentEmails < ActiveRecord::Migration
  def change
    create_table :sent_emails do |t|
      t.text :content
      t.datetime :created_at
    end
  end
end
