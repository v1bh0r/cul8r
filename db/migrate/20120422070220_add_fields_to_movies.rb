class AddFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :year, :integer

    add_index :movies, :name
    add_index :movies, :year

  end
end
