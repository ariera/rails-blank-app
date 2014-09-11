url_options = {
  'development' => {:host => "localhost"},
  'test'        => {:host => "localhost"},
  'production'  => {:host => 'www.yourdomain.com'}
}

ActionMailer::Base.default_url_options = url_options[Rails.env]
Rails.application.routes.default_url_options = url_options[Rails.env]

