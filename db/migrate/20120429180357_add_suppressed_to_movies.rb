class AddSuppressedToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :suppressed, :boolean, :default => false

  end
end
