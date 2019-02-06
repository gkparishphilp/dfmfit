class WaiverMailer < ActionMailer::Base
  default from: "info@crossfit2120.com"


  def waiver_notification(waiver)
    @waiver = waiver
   mail(to: "dan@crossfit2120.com",
        subject: 'New signed waiver at Crossfit2120')
 end
end
