class CreateMovieDatabaseProviders < ActiveRecord::Migration
  def change
    create_table :movie_database_providers do |t|
      t.string :name
    end

    MovieDatabaseProvider.create(:name=>'Manual Data Entry')
    MovieDatabaseProvider.create(:name=>'Rotten Tomatoes')

    remove_column :movies, :provider_type
    remove_column :movies, :provider_id

    add_column :movies, :movie_database_provider_id, :integer, :default => 1
  end
end
