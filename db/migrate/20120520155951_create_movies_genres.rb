class CreateMoviesGenres < ActiveRecord::Migration
  def change
    create_table :movies_genres do |t|
      t.integer :movie_id
      t.integer :genre_id
    end
    add_index :movies_genres, :movie_id
    add_index :movies_genres, :genre_id
    add_index :movies_genres, [:movie_id,:genre_id], :unique => true
  end
end
