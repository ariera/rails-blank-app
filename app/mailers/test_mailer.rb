class TestMailer < ActionMailer::Base
  include AsyncDelivery
  default :from => '"Darth Vader" <vader@deathstar.imp>'
  def testing(user)
    unless user.is_a? OpenStruct # this because OpenStruct are serialized in a weird way
      user = OpenStruct.new(user["table"])
    end
    mail(:to => user.email, :subject => "[Rails Blank App] Testing #{DateTime.now.stamp("1999-12-31 23:59:59")}")
  end
end
