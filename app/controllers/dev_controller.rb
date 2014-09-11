class DevController < ApplicationController
  layout "public"
  before_filter :must_be_in_development!
  before_filter :set_seo_vars

  if Rails.env.development? || Rails.env.test? || Rails.env.staging?
    def impersonate
      redirect_to "/"
    end

    def locales
    end
  end

  private

  def must_be_in_development!
    raise ActiveRecord::RecordNotFound unless Rails.env.development? || Rails.env.test?
  end

  def set_seo_vars(node=nil)
    case self.action_name.to_sym
    when :locales
      seo_vars[:title] = t('dev.locales_seo_title')
      seo_vars[:desc]  = t('dev.locales_intro')
    end
  end
end
