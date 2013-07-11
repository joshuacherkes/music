class UserMailer < ActionMailer::Base
  default from: "no_reply@facebook.a.com"

  def welcome_email(user, token)
    @user = user
    @token = token
    @url = "http://localhost:3000/sessions/new"
    mail(to: user.email, subject: 'free viagra!')
  end
end
