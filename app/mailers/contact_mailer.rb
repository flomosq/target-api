class ContactMailer < ApplicationMailer
  def contact(email, message)
    @email = email
    @message = message
    mail to: ENV['ADMIN_EMAIL'], from: ENV['REPLY_TO_EMAIL'],
         subject: I18n.t('contact_mailer.contact.subject')
  end
end
