require "bike"

describe Bike do
  # removed as .working? doesn't exist any mroe due to broken?
  # it "object to respond to .working?" do
  #   bike = Bike.new
  #   expect(bike).to respond_to(:working?)
  # end 

  it "can be reported broken" do
    subject.report_broken
    # predicate matcher below
    expect(subject).to be_broken
  end
end