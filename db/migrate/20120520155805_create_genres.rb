class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :rank, :default=> 1
    end

    add_index :genres, :name
  end
end
