class NotificationMailer < ApplicationMailer

  FROM_EMAIL = Rails.application.secrets.FROM_EMAIL
  TO_EMAIL = Rails.application.secrets.TO_EMAIL
  SITE_NAME = Rails.application.secrets.SITE_NAME

  default from: FROM_EMAIL

  def notification_email(devices)
    @devices  = devices
    @site_name = SITE_NAME
    mail(to: TO_EMAIL, subject: 'New device detected on network')
  end

end
