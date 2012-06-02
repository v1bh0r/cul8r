class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :goto_main_page_if_logged_in, :only => :index

  def index
  end

  def about
  end

  def contact
    if request.post?
      @email = params[:email]
      @message = params[:message]
      if @email.nil? or @email.blank? or @message.nil? or @message.blank?
        flash[:error] = 'Please enter both email and message'
      else
        AdminNotification.contact_us(@email, @message).deliver
        flash[:success] = 'Thanks! Your email has been sent. We\'ll reply soon.'
      end
    end
  end

  def goto_main_page_if_logged_in
    if user_signed_in?
      redirect_to movies_path
    end
  end
end
