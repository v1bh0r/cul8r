class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper :layout
  before_filter :fix_naked_domains
  before_filter :watch_list_count

  def fix_naked_domains
    if request.env['HTTP_HOST'] != APP_DOMAIN
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end

  def watch_list_count
    @watch_list_count ||= current_user.watch_list_movie_entries.count if user_signed_in?
  end

  def watch_list_count=(count)
    @watch_list_count = count if user_signed_in?
  end
end
