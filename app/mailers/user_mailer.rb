class UserMailer < ApplicationMailer
  default from: 'notifications@test.com'
 
    def notification_email(user)
      
      @url  = "http://localhost:3000/images/#{user.id}/download"
      mail(to: user.email, subject: 'Welcome to My Test Site')
    end
end
