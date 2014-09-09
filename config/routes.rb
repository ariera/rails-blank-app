Rails.application.routes.draw do
  root 'home#index'
  match "/dev/:action" => "dev#:action", :via => :all, :as => 'dev'
end
