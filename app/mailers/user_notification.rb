class UserNotification < ActionMailer::Base
  default from: "friends@cul8r.me"

  def welcome(user)
    @user = user
    mail :to => user.email, :subject => 'Welcome to CU l8r'
  end

  def daily_summary(user, subject, notifications)
    @user = user
    @notifications = notifications
    mail :to => user.email, :subject => subject
  end
end
