require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity 
  end

  def make_land(plane)
    landing_check(plane)
    plane.land
    @planes << plane
    plane
  end

  def make_take_off(plane)
    take_off_check(plane)
    plane.take_off
    @planes.delete(plane)
    plane
  end

  private 

  attr_writer :capacity

  def airport_full?
    @planes.count >= capacity
  end

  def landing_check(plane)
    fail 'Plane has already landed' if @planes.include? plane
    fail 'Airport is full' if airport_full?
    fail 'The weather is too stormy' if stormy?
  end

  def take_off_check(plane)
    fail 'Plane has already taken off' if plane.flying?
    fail 'The weather is too stormy' if stormy?
  end
  
end
