class ChangeMoviesImdbRatingType < ActiveRecord::Migration
  def up
    change_column :movies, :imdb_rating, :float
    change_column :movies, :rating, :float
  end

  def down
  end
end
