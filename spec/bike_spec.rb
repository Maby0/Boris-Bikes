require "bike"

describe Bike do
  it "object to respond to .working?" do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end 

  it "can be reported broken" do
    subject.report_broken
    # predicate matcher below
    expect(subject).to be_broken
  end
end