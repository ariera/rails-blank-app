class DevController < ApplicationController
  layout "public"
  before_filter :must_be_in_development!

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
end
