require 'ruby-tmdb'

class RemoteMovieDatabase
  def initialize
    Tmdb.api_key = "44bc7498e6a13c4ef3ac405df1dbcfdf"
    Tmdb.default_language = "en"
  end

  def upcoming_movies page = 1, language = 'en', countries = 'us,uk'
    TmdbMovie.browse(
      :order_by => "release",
      :order => "asc",
      :page => page,
      :per_page => 10,
      :language => language,
      :expand_results => false,
      :release_min => 1.month.ago,
      :release_max => 2.months.from_now,
      :countries => countries )
  end
  
end
