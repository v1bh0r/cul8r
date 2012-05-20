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
      add_movie(provider, movie)
    end
  end

  def add_new_released_dvds
    provider = MovieDatabaseProvider.find_by_name 'Rotten Tomatoes'
    new_dvds = @rotten_tomatoes.lists.new_dvd_releases
    new_dvds.each do |movie|
      this_movie = add_movie(provider, movie, true)
    end
  end

  def add_movie(provider, movie, dvd_released = false)
    info = movie.info
    this_movie = provider.movies.find_or_initialize_by_name_and_year(
        :name => info['title'],
        :year => info['year'])

    this_movie.update_attributes(
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
        :release_dates => Date.parse(info['release_dates']['theater']),
        :is_dvd_available => dvd_released)

    attach_elaborate_info this_movie
  end

  def attach_elaborate_info movie
    elaborate_info = @rotten_tomatoes.movies.search_by_id movie.md_ref_id
    genre_names = elaborate_info.genres
    genres = genre_names.collect { |genre_name| Genre.find_or_create_by_name genre_name }
    existing_genres = movie.genres
    genres_to_add = genres - existing_genres
    movie.genres << genres_to_add
  rescue Exception => e
    #do nothing
  end
end
