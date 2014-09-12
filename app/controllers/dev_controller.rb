class DevController < ApplicationController
  before_filter :must_be_in_development!
  before_filter :set_seo_vars

  if Rails.env.development? || Rails.env.test? || Rails.env.staging?
    def impersonate
      redirect_to "/"
    end

    def locales
    end

    def access_denied
      raise CanCan::AccessDenied
    end

    def flash_messages
      flash[:alert]        = "I am a `alert` flash message"
      flash[:error]        = "I am a `error` flash message"
      flash[:notice]       = "I am a `notice` flash message"
      flash[:non_existent] = "I am a `not_existant` flash message"
    end

    def bootstrap_data
      @bootstrap_example_from_backend = {
        title:   'BootstrapData is working! :D',
        content: "This text is generated from the backend, serialized into json in the render, and recovered and showed by javascript"
      }
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
