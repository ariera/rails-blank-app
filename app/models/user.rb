class User < ActiveRecord::Base
  validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }
end
