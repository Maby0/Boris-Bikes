require "docking_station"

describe DockingStation do
  describe '#release_bike' do
    it "DockingStation object to respond to #release_bike" do
      expect(subject).to respond_to(:release_bike)
      # one-liner version of above: it { is_expected.to respond_to :release_bike }
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
    end

    it "doesn't release a broken bike" do
      # this stores the bike as 'true' for some reason
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No bikes available'
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
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end
  end

  describe '#bike attribute' do
    it "is now private - doesn't respond to bikes attribute" do
      expect { subject.bikes }.to raise_error(NoMethodError)
    end

    # below test not applicable any more?
    # it "returns docked bikes" do
    #   bike = Bike.new
    #   subject.dock(bike)
    #   expect(subject.bikes).to eq([bike])
    # end
  end



  describe 'initialization' do
    it "responds to capacity attribute" do
      expect(subject).to respond_to(:capacity)
    end

    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end

    it "has a variable capacity" do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike) }
      expect { docking_station.dock(bike) }.to raise_error 'Docking station full'
    end
  end
end