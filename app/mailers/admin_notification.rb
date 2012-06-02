class AdminNotification < ActionMailer::Base
  default from: "vibhor.mahajan@gmail.com"
  default to: "vibhor.mahajan@gmail.com"

  def contact_us (contact_email, message)
    @contact_email = contact_email
    @message = message
    mail  :subject => 'CU l8r Contact us'
  end
end
