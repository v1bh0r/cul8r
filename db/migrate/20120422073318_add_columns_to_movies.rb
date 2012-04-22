class AddColumnsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :critics_rating, :string
    add_column :movies, :critics_score, :integer
    add_column :movies, :synopsis, :text
    add_column :movies, :poster_thumbnail, :string
    add_column :movies, :poster_profile, :string
    add_column :movies, :poster_detailed, :string
    add_column :movies, :poster_original, :string
    add_column :movies, :abridged_cast, :text
    add_column :movies, :release_dates, :date
  end
end
