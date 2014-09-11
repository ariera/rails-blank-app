class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "public"

  include LocaleAware
  before_filter :set_locale
  before_filter :set_user_locale_if_unset

  def current_user
    User.first
  end
  helper_method :seo_vars, :return_here_url

  private

  def return_here_url(query={})
    _return = Addressable::URI.parse(request.fullpath)
    _return.query_values = (HashWithIndifferentAccess.new(_return.query_values) || {}).merge(query)
    _return.scheme= request.scheme
    _return.host = request.host
    # _return.port = CONFIG[:"#{request.scheme}_port"]
    _return.to_s
  end

  def seo_vars
    @seo_vars ||= {
      :title => t('seo_default_title'),
      :meta_desc => t('seo_default_desc'),
      :meta_lang => I18n.locale
    }
  end

end
