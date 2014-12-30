require 'spec_helper'

describe "timezone" do
  it "Rails time zone and system time zone should be the same" do
    # If you run `date` on your linux machine it should show that uses UTC format too. Otherwise you should probably fix this.
    # Time.now -- system timezone
    # Time.zone.now - rails app timezone
    expect(Time.zone.parse("2013-05-01 00:00").to_i).to eq(Time.parse("2013-05-01 00:00").to_i)
    expect(`date`).to match(/UTC/)
  end
end
