class MoviesController < ApplicationController

  def index
    @search_query = params[:q]
    conditions = @search_query.nil? ? nil : ["name like ?", "%#{@search_query}%"]
    @movies = Movie.all(:limit => 20, :order => 'id desc', :conditions => conditions)
    @movies_in_watch_list = current_user.movies_in_watch_list
  end

  def show
    @movie = Movie.find params[:id]
    render :layout => false
  end

  def cul8r
    entry = current_user.watch_list_movie_entries.create(:movie_id => params[:movie_id])
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
    if current_user.watch_list_movie_entries.destroy(:movie_id => params[:movie_id])
      render json: {}, :status => :ok, :content_type => :json
    else
      render json: 'Some problem occurred', :status => :bad_request, :content_type => :json
    end
  end
end
