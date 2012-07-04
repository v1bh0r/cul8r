class MoviesController < ApplicationController
  def index
    @genres = Genre.all(:order => :rank)
    @latest_movies = Movie.all(:order => 'id desc', :limit => 6)
    @recommended_movies = current_user.recommended_movies
  end

  def show
    @movie = Movie.find params[:id]
  end

  def show_popup
    @movie = Movie.find params[:movie_id]
    render :layout => false
  end

  def cul8r
    entry = current_user.watch_list_movie_entries.create(:movie_id => params[:movie_id])
    @watch_list_count = @watch_list_count + 1
    respond_to do |format|
      if entry.errors.messages.empty?
        #update the list
        format.js { @movie = Movie.find params[:movie_id] }
      else
        format.js { @errors = entry.errors.messages.values.join(', ') }
      end
    end
  end

  def un_cul8r
    @id_to_remove = params[:dom_id]
    @movie = WatchListMovieEntry.find_by_user_id_and_movie_id current_user.id, params[:movie_id]
    @movie.destroy
    @watch_list_count = @watch_list_count - 1
    respond_to do |format|
      format.js { @movie = Movie.find params[:movie_id] }
    end
  end

  def watch_list
    @movies_in_watch_list = current_user.movies_in_watch_list
  end
end
