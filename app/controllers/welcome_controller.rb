class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index
  before_filter :goto_main_page_if_logged_in

  def index
  end
  
  def goto_main_page_if_logged_in
    if user_signed_in?
      redirect_to movies_path
    end
  end
end
