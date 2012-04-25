require 'remote_movie_database'

class Movie < ActiveRecord::Base
  default_scope
  belongs_to :movie_database_provider
  validates_presence_of :name, :year, :poster_original, :poster_detailed, :poster_profile, :poster_thumbnail
  has_many :watch_list_movie_entries, :dependent => :destroy

  serialize :abridged_cast, Array

  def self.fetch_new_movies
    #English movies
    mdb = RemoteMovieDatabase.new
    mdb.add_upcoming_movies
  end

  def name_and_year
    "#{self.name} (#{self.year})"
  end
end
