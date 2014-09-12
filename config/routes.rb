Rails.application.routes.draw do
  root 'static#landing'
  match "/page/:action" => "static#:action", :via => :all, :as => 'page'
  match "/dev/:action" => "dev#:action", :via => :all, :as => 'dev'
end
