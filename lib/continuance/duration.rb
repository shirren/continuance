require 'time'
require 'continuance/base_date'

# Continuance module
module Continuance
  # Duration is a measure of how long something takes to do
  # where our resolution is limited to hours, minutes, seconds
  # and nano seconds which should be enough to measure anything
  class Duration
    include Comparable

    attr_reader :hours, :minutes
    attr_reader :seconds, :nano_seconds

    # Default constructor which creates a base time marker in order
    # to calculate proper times when a duration is specified as a string
    def initialize(hours = 0, minutes = 0, seconds = 0, nano_seconds = 0)
      @hours = hours
      @minutes = minutes
      @seconds = seconds
      @nano_seconds = nano_seconds
    end

    # Should be able to calculate the difference between two durations objects
    # as seconds
    def -(other)
      other_time = Time.strptime(other.to_s, '%H:%M:%S.%N', BaseDate.new.val)
      self_time = Time.strptime(to_s, '%H:%M:%S.%N', BaseDate.new.val)
      convert_to(self_time - other_time)
    end

    # Should be able to calculate the sum of two durations objects
    # as seconds, this is returned as a float value
    def +(other)
      convert_to(to_f + other.to_f)
    end

    # A duration can be serialized to a string, this is used not only for visual
    # purposes, but to also use in other computations like the difference operation
    def to_s
      sub_sec = @nano_seconds.to_f / (10**9)
      sub_sec_str = sub_sec.to_s.gsub('0.', '')
      "#{@hours}:#{@minutes}:#{@seconds}.#{sub_sec_str}"
    end

    # Converts a duration object to it's equivalent number of seconds, this value
    # is returned as a float value
    def to_f
      # TODO: This calculation can result in floating point errors when the duration
      # is converted to and from a float value
      (@hours * 3600) + (@minutes * 60) + @seconds + (@nano_seconds.to_f / 10**9)
    end

    # Total equivalence implementation including the objects type
    def eql?(other)
      other.class == self.class && self == other
    end

    # Comparable implementation for a duration object
    def <=>(other)
      if to_f < other.to_f
        -1
      elsif to_f > other.to_f
        1
      else
        0
      end
    end

    # A duration can be created by specifying the time as a string and providing a valid
    # format for the time. The supported formats are listed at
    # http://ruby-doc.org/core-2.2.1/Time.html
    def self.create(duration, format)
      time_val = Time.strptime(duration, format, BaseDate.new.val)
      Duration.new(time_val.hour, time_val.min, time_val.sec, time_val.nsec)
    end

    private

    # Converts a time in seconds to a duration object
    def convert_to(time_as_float)
      Duration.create(time_as_float.to_s, '%S.%N')
    end
  end
end
