require "docking_station"

describe DockingStation do
  it "DockingStation object to respond to .release_bike" do
    expect(subject).to respond_to(:release_bike)
    p subject
    # it { is_expected.to respond_to :release_bike }
  end

  it "get a bike from .release_bike" do
    expect(subject.release_bike).to be_a Bike
  end

  it "expects a bike to be working" do
    expect(subject.release_bike.working?).to eq true
    # expect(Bike.new).to be_working
  end
end