ActionMailer::Base.smtp_settings = { 
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => "plain",
   :enable_starttls_auto => true,
   :user_name => "connect2pkd@gmail.com",
   :password => "Pkd2016!@",
   :openssl_verify_mode  => 'none'
}