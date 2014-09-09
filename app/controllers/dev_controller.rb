class DevController < ApplicationController
  before_filter :authenticate_company!, :except=> :impersonate

  if Rails.env.development? || Rails.env.test? || Rails.env.staging?
    def impersonate
      company = Company.find(params.require(:company_id))
      sign_in(:company, company)
      redirect_to "/"
    end
  end
end
