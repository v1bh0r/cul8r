class AddIsDvdAvailableToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :is_dvd_available, :boolean
  end
end
