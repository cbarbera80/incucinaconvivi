class Newsletter < ActionMailer::Base
  default from: 'notifications@example.com'

  def welcome_email(subscriber)
    @user = subscriber
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
