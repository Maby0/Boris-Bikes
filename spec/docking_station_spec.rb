require "docking_station"

describe DockingStation do
  it "DockingStation object to respond to .release_bike" do
    expect(subject).to respond_to(:release_bike)
    # it { is_expected.to respond_to :release_bike }
  end
end