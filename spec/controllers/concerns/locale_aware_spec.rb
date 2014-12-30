require 'spec_helper'

describe DevController do
  render_views true
  DEFAULT_LOCALE = :en
  I18n.default_locale = DEFAULT_LOCALE
  let(:default_locale) { DEFAULT_LOCALE }
  let(:other_locale)   { :es }

  describe "when no user is logged in" do
    it "always stores the chosen locale in the session" do
      expect(controller.session_locale).to be_nil
      get :locales, "#{LocaleAware::LOCALE_PARAM}" => other_locale
      expect(controller.session_locale.to_sym).to eq(other_locale)
    end

    it "has #{DEFAULT_LOCALE} as default language" do
      expect(controller.session_locale).to be_nil
      get :locales

      expect(controller.params_locale).to         be_nil
      expect(controller.user_locale).to           be_nil
      expect(controller.session_locale.to_sym).to eq(default_locale)
      expect(controller.browser_locale).to        be_nil
      expect(response.body).to                    have_content(I18n.t('dev.locales_intro', locale:default_locale))
    end

    it "can read the locale from the url param" do
      expect(controller.session_locale).to be_nil
      get :locales, "#{LocaleAware::LOCALE_PARAM}" => other_locale

      expect(controller.params_locale.to_sym).to  eq(other_locale)
      expect(controller.user_locale).to           be_nil
      expect(controller.session_locale.to_sym).to eq(other_locale)
      expect(controller.browser_locale).to        be_nil
      expect(response.body).to                    have_content(I18n.t('dev.locales_intro', locale:other_locale))
    end

    it "can read the locale from the browser" do
      expect(controller.session_locale).to be_nil
      # @request.headers["Accept-Language"] = "es-ES"
      @request.headers["Accept-Language"] = other_locale
      get :locales

      expect(controller.params_locale).to         be_nil
      expect(controller.user_locale).to           be_nil
      expect(controller.session_locale.to_sym).to eq(other_locale)
      expect(controller.browser_locale.to_sym).to eq(other_locale)
      expect(response.body).to                    have_content(I18n.t('dev.locales_intro', locale:other_locale))
    end

    it "can read the locale from the session" do
      expect(controller.session_locale).to be_nil

      get :locales, "#{LocaleAware::LOCALE_PARAM}" => other_locale
      expect(controller.session_locale.to_sym).to eq(other_locale)

      get :locales
      expect(controller.params_locale).to         be_nil
      expect(controller.user_locale).to           be_nil
      expect(controller.session_locale.to_sym).to eq(other_locale)
      expect(controller.browser_locale).to        be_nil
      expect(response.body).to                    have_content(I18n.t('dev.locales_intro', locale:other_locale))
    end
  end

  describe "when a user is logged in" do
    before :each do
      @user = FactoryGirl.create(:user)
      allow(controller).to receive(:current_user).and_return(@user)
    end
    context "and the user doesnt have a locale persisted" do
      it "persists the locale in the user model" do
        @user.locale = nil
        expect(controller.user_locale).to be_nil
        get :locales

        expect(controller.user_locale).to eq(default_locale)
        expect(response.body).to have_content(I18n.t('dev.locales_intro', locale:default_locale))
      end
    end

    context "and the user has a locale persisted" do
      it "uses the user locale (unless a param is passed)" do
        @user.locale = other_locale
        expect(controller.user_locale).to eq(other_locale)
        get :locales

        expect(controller.user_locale).to eq(other_locale)
        expect(response.body).to have_content(I18n.t('dev.locales_intro', locale:other_locale))
      end
    end
  end

end
