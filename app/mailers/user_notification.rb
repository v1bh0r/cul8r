class UserNotification < ActionMailer::Base
  default from: "vibhor@cul8r.me"

  def welcome user
    @user = user
    mail :to => user.email
  end

end
