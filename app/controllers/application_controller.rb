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

  def current_ability
    @current_ability ||= Ability.new(current_user)
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

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      follow_return_to_or(format) do
        format.json{render :json => {redirect_to: "/"}}
        format.html{redirect_to "/", :alert => exception.message}
      end
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_404
  end

  def seo_vars
    @seo_vars ||= {
      :title => t('seo_default_title'),
      :meta_desc => t('seo_default_desc'),
      :meta_lang => I18n.locale
    }
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found, :layout=>false }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  # example of use, write this in your controller:
  #   follow_return_to_or(f) do
  #     f.html { redirect_to collection_path(@entry.collection_id) }
  #     f.json { render :show }
  #   end
  def follow_return_to_or(f, &block)
    url =  params[:return_to_url]
    if url
      f.html{redirect_to url}
      f.json{render :json => {redirect_to:url}}
    else
      block.call
    end
  end
end
