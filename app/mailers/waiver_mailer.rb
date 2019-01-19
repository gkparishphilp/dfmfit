class WaiverMailer < ActionMailer::Base
  default from: "https://crossfit2120.herokuapp.com/"


  def waiver_notification(waiver)
    @waiver = waiver
   mail(to: "lali20021@gmail.com",
        subject: 'New signed waiver at Crossfit2120')
 end
end
