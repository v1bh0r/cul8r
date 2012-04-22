class AddRottenTomatoesResponseToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rotten_tomatoes_info, :text

  end
end
