class Newsletter < ActionMailer::Base
  default from: 'notifications@example.com'

  def welcome_email(subscriber)
    @subscriber = subscriber
    @url  = 'http://example.com/login'
    mail(to: @subscriber.email, subject: 'Welcome to My Awesome Site')
  end

end
