class MoviesController < ApplicationController
  def index
    @movies = Movie.all(:limit=>5, :order => 'id desc', :conditions => "poster_original is not null")
  end

  def show
    @movie = Movie.find params[:id]
  end
end
