require 'time'

# Duration is a measure of how long something takes to do
# where our resolution is limited to hours, minutes, seconds
# and milliseconds which should be enough to measure anything
class Duration

  attr_reader :hours, :minutes, :seconds, :milli_seconds

  # Default constructor which creates a base time marker in order
  # to calculate proper times when a duration is specified as a string
  def initialize(hours = 0, minutes = 0, seconds = 0, milli_seconds = 0)
    @base_time = Time.parse('00:00:00')
    @hours, @minutes, @seconds, @milli_seconds = hours, minutes, seconds, milli_seconds
  end

  # A duration can be created by specifying the time as a string and providing a valid
  # format for the time
  def self.create(duration, format)

  end
end