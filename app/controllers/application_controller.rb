class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper :layout
  before_filter :fix_naked_domains

  def fix_naked_domains
    if request.env['HTTP_HOST'] != APP_DOMAIN
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end
end
