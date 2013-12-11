if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => "app20216004@heroku.com",
    :password       => "t4w2re4n",
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end