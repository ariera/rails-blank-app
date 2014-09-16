class DummyScheduler
  def self.queue
    :dummy
  end

  def self.perform
    true
  end
end
