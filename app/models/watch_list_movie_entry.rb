class WatchListMovieEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates_presence_of :user_id
  validates_presence_of :movie_id
  validates_uniqueness_of :movie_id, :scope => :user_id, :message => "This movie is already in your watch list."

  default_scope order('created_at DESC')

end
