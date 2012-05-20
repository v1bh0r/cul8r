class Genre < ActiveRecord::Base
  has_many :movies_genres
  has_many :movies, :through => :movies_genres
end
