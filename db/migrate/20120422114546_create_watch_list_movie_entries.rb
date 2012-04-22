class CreateWatchListMovieEntries < ActiveRecord::Migration
  def change
    create_table :watch_list_movie_entries do |t|
      t.integer :user_id
      t.integer :movie_id
      t.timestamps
    end

    add_index :watch_list_movie_entries, :user_id, :name=>'idx_watch_list_user'
    add_index :watch_list_movie_entries, :movie_id
  end

end


