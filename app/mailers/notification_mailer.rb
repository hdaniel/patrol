class NotificationMailer < ApplicationMailer

  include ActionView::Helpers::TextHelper

  FROM_EMAIL = Rails.application.secrets.FROM_EMAIL
  TO_EMAIL = Rails.application.secrets.TO_EMAIL
  SITE_NAME = Rails.application.secrets.SITE_NAME

  default from: FROM_EMAIL

  def notification_email(devices)
    @devices  = devices
    device_string = pluralize(@devices.count, 'Device')
    subject = "#{SITE_NAME} - #{device_string} detected on network"
    @body_intro = "#{subject}:"
    mail(to: TO_EMAIL, subject: subject)
  end

end
