class ContactMailer < ApplicationMailer
  def contact(email, message)
    @email = email
    @message = message
    mail to: ENV['ADMIN_EMAIL'], from: @email, subject: I18n.t('contact_mailer.contact.subject')
  end
end
