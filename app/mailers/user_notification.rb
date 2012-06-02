class UserNotification < ActionMailer::Base
  default from: "friends@cul8r.me"

  def welcome user
    @user = user
    mail :to => user.email, :subject => 'Welcome to CU l8r'
  end

end
