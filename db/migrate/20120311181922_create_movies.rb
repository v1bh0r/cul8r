class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :name
      t.string :alt_name
      t.integer :popularity
      t.integer :rating
      t.integer :imdb_rating
      t.integer :provider_type
      t.string :provider_id
      t.string :imdb_id
      t.text :overview
      t.string :image_url
      t.string :url
      t.string :trailer_url
      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
