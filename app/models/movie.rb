require 'remote_movie_database'

class Movie < ActiveRecord::Base
  has_many :movies_genres
  has_many :genres, :through => :movies_genres

  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope
  belongs_to :movie_database_provider
  validates_presence_of :name, :year, :poster_original, :poster_detailed, :poster_profile, :poster_thumbnail
  has_many :watch_list_movie_entries, :dependent => :destroy

  has_many :users, :through => :watch_list_movie_entries

  serialize :abridged_cast, Array

  def self.fetch_new_data
    #English movies
    mdb = RemoteMovieDatabase.new
    mdb.add_upcoming_movies
    mdb.add_new_released_dvds
  end

  def name_and_year
    "#{self.name} (#{self.year})"
  end
  #
  #def should_generate_new_friendly_id?
  #  new_record?
  #end
end
