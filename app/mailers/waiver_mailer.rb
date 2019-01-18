class WaiverMailer < ActionMailer::Base
  default to: "lali20021@gmail.com"

  def waiver_notification(waiver)
    @waiver = waiver 
   mail(subject: 'New signed waiver at Crossfit2120')
 end
end
