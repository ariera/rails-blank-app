class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "public"

  include LocaleAware
  before_filter :set_locale
  before_filter :set_user_locale_if_unset

end
