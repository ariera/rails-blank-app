if Rails.env.test?
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :test
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = { :address => "localhost", :port => 1025 }
  ActionMailer::Base.raise_delivery_errors = true
  # ActionMailer::Base.perform_deliveries = false
  # class OverrideMailReciptient
  #   def self.delivering_email(mail)
  #     mail.subject = "#{Time.now.to_i.to_s} - #{mail.subject}"
  #     mail.to = %W(app_developer_account@gmail.com another_app_developer@hotmail.com)
  #   end
  # end
  # ActionMailer::Base.register_interceptor(OverrideMailReciptient)
end

# TO USE GOOGLE APPS
#
# ActionMailer::Base.smtp_settings = {
#   :address => "smtp.gmail.com",
#   :port => 587,
#   :authentication => :plain,
#   :domain => 'gmail.com',
#   :enable_starttls_auto => true,
#   :user_name => "app@gmail.com",
#   :password => "awesomepassword"
# }
#
# TO USE AMAZON SES
#
# aws_config = Rails.application.secrets.amazon
# ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
#   :access_key_id     => aws_config['access_key_id'],
#   :secret_access_key => aws_config['secret_access_key']
# ActionMailer::Base.delivery_method = :ses
