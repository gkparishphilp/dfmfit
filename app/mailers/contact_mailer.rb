class ContactMailer < ActionMailer::Base
  default to: "info@crossfit2120.com"

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

   mail(from: email, subject: 'Crossfit2120 Contact Form Message')
 end
end
