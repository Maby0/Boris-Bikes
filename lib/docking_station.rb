require_relative 'bike'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if bikes.empty?
      fail 'No bikes available'
    elsif bikes.find { |b| !b.broken? }.nil?
      fail 'No bikes available'
    else 
      bikes.delete(bikes.find { |b| !b.broken? })
    end
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end

end