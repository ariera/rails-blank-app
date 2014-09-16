module AsyncDelivery
  def self.included(base)
    base.extend ClassMethods
    base.instance_eval do
      @queue = :main
    end
  end

  # How to Use:
  #   Include this module in your Mailer (i.e. TestMailer)
  #   Now you can call async_deliver. Arguments accepted
  #     1) [mailer_name] The name of the of the mail to send
  #     2) [*args] The arguments that the mailer will receive
  #   Example:
  #     TestMailer.async_deliver(:test, user)
  def async_deliver(*args)
    if !$async && (Rails.env.test? || Rails.env.cucumber? || Rails.env.development?)
      self.class.perform(*args)
    else
      Resque.enqueue(self.class, *args)
    end
  end

  module ClassMethods
    def perform(mailer_name, *args)
      self.send(mailer_name, *args).deliver
    end
  end
end
