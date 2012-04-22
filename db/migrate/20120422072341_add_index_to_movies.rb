class AddIndexToMovies < ActiveRecord::Migration
  def change
    add_index :movies, :movie_database_provider_id, :name => 'idx_mov_provider'
  end
end
