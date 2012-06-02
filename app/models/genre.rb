class Genre < ActiveRecord::Base
  has_many :movies_genres
  has_many :movies, :through => :movies_genres

  def featured_movies
    self.movies.all(:order => "release_dates desc", :limit => 6)
  end
end
