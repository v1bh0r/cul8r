require 'remote_movie_database'

class Movie < ActiveRecord::Base
  attr_accessible :name, :alt_name, :popularity, :rating, :imdb_rating, :provider_type, :provider_id, :imdb_id, :overview, :image_url, :url, :trailer_url

  def self.refresh_database
    #English movies
    mdb = RemoteMovieDatabase.new
    counter = 1
    continue_scan = true
    while continue_scan
      movies = mdb.upcoming_movies counter
      if movies.empty?
        continue_scan = false
      else
        movies.each do |movie|
          Movie.find_or_create_by_name movie.name
        end
        counter += 1
      end

    end
  end
end
