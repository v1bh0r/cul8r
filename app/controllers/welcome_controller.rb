class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :goto_main_page_if_logged_in, :only=>:index

  def index
  end

  def about
  end

  def contact
  end
  
  def goto_main_page_if_logged_in
    if user_signed_in?
      redirect_to movies_path
    end
  end
end
