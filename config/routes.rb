Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :confirmations => "users/confirmations",
    :passwords     => "users/passwords",
    :registrations => "users/registrations",
    :sessions      => "users/sessions",
    :unlocks       => "users/unlocks",
  }

  root 'static#landing'
  match "/page/:action" => "static#:action", :via => :all, :as => 'page'
  match "/dev/:action" => "dev#:action", :via => :all, :as => 'dev'

end
