class ContactMailer < ActionMailer::Base
  default to: "lali20021@gmail.com"

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

   mail(from: email, subject: 'Crossfit2120 Contact Form Message')
 end
end
