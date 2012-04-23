#require 'ruby-tmdb'
require 'badfruit'

class RemoteMovieDatabase
  def initialize
    @rotten_tomatoes = BadFruit.new("4fmrb2sbk98peppc4cx7u3f9")
  end

  def add_upcoming_movies
    provider = MovieDatabaseProvider.find_by_name 'Rotten Tomatoes'
    upcoming_movies = @rotten_tomatoes.lists.upcoming_movies
    upcoming_movies.each do |movie|
      info = movie.info
      provider.movies.find_or_create_by_name_and_year(
          :md_ref_id => info['id'],
          :name => info['title'],
          :year => info['year'],
          :critics_rating => info['ratings']['critics_rating'],
          :critics_score => info['ratings']['critics_score'],
          :synopsis => info['synopsis'],
          :poster_thumbnail => info['posters']['thumbnail'],
          :poster_profile => info['posters']['profile'],
          :poster_detailed => info['posters']['detailed'],
          :poster_original => info['posters']['original'],
          :abridged_cast => info['abridged_cast'],
          :release_dates => Date.parse(info['release_dates'])
      )
    end
  end

end
