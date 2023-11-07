class UserMailer < ApplicationMailer
    default from: ENV['MAILJET.DEFAULT_FROM']

    def welcome_email(user)
        @user = user
        @url = 'https://eventbritee.fly.dev' #'http://localhost:3000/login'  
        mail(to: @user.email, subject: 'Bievenue chez nous !')
    end
end
