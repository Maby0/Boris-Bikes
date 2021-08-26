require "docking_station"

describe DockingStation do
  describe '#release_bike' do
    it "DockingStation object to respond to #release_bike" do
      expect(subject).to respond_to(:release_bike)
      # it { is_expected.to respond_to :release_bike }
    end

    it "get a bike from .release_bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it "expects a bike to be working" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike.working?).to eq true
      # expect(Bike.new).to be_working
    end

    it "raises an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it "responds to #dock with 1 argument" do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it "able to dock bike if empty" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq([bike])
    end

    it "raises an error when full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end
  end

  describe '#bike attribute' do
    it "responds to bike method" do
      expect(subject).to respond_to(:bikes)
    end

    it "returns docked bikes" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq([bike])
    end
  end
end