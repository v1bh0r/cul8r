require 'remote_movie_database'

class Movie < ActiveRecord::Base
  belongs_to :movie_database_provider

  serialize :abridged_cast, Array

  def self.refresh_database
    #English movies
    mdb = RemoteMovieDatabase.new
    mdb.add_upcoming_movies
  end

  def name_and_year
    "#{self.name} (#{self.year})"
  end
end
