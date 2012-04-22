class AddColumnToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :md_ref_id, :string
    add_index :movies, :md_ref_id
    add_index :movies, [:name, :year]
  end
end
