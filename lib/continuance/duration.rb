require 'time'
require 'continuance/base_date'

# Duration is a measure of how long something takes to do
# where our resolution is limited to hours, minutes, seconds
# and nano seconds which should be enough to measure anything
class Duration
  attr_reader :hours, :minutes
  attr_reader :seconds, :nano_seconds

  # Default constructor which creates a base time marker in order
  # to calculate proper times when a duration is specified as a string
  def initialize(hours = 0, minutes = 0, seconds = 0, nano_seconds = 0)
    @hours, @minutes = hours, minutes
    @seconds, @nano_seconds = seconds, nano_seconds
  end

  # Should be able to calculate the difference between two durations objects
  # as seconds
  def -(other)
    other_time = Time.strptime(other.to_s, "%H:%M:%S.%N", BaseDate.new.val)
    self_time = Time.strptime(self.to_s, "%H:%M:%S.%N", BaseDate.new.val)
    self_time - other_time
  end

  # Should be able to calculate the sum of two durations objects
  # as seconds
  def +(other)
    self.to_i + other.to_i
  end

  # A duraction can be serialized to a string, this is used not for visual purposes, but
  # to also use in other computations like the difference
  def to_s
    sub_sec = @nano_seconds.to_f / (10 ** 9)
    sub_sec_str = sub_sec.to_s.gsub('0.','')
    "#{@hours}:#{@minutes}:#{@seconds}.#{sub_sec_str}"
  end

  # Converts a duration object to a number of seconds
  def to_i
    (@hours * 3600) + (@minutes * 60) + @seconds + (@nano_seconds.to_f / 10 ** 9)
  end

  # A duration can be created by specifying the time as a string and providing a valid
  # format for the time. The supported formats are listed at
  # http://ruby-doc.org/core-2.2.1/Time.html
  def self.create(duration, format)
    time_val = Time.strptime(duration, format, BaseDate.new.val)
    Duration.new(time_val.hour, time_val.min, time_val.sec, time_val.nsec)
  end
end