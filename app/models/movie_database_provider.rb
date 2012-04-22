class MovieDatabaseProvider < ActiveRecord::Base
  has_many :movies
end
