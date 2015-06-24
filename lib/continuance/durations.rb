# Module Continuance
module Continuance
  # Durations takes a collection of duration objects on which some standard
  # collection operations can be performed such as average etc
  class Durations
    attr_reader :items

    # Constructor can take a sequence of duration objects, objects outside
    # of durations are ignored
    def initialize(items = [])
      @items = items
    end

    # Given a series of durations, this function calculates the average duration
    # by converting each duration to an absolute float value
    def average
      time = Time.at(avg_as_f).utc.strftime('%H:%M:%S:%N')
      Duration.create(time, '%H:%M:%S:%L')
    end

    # In mathematics average is also known by the terms median and
    # arithmetic mean
    alias_method :arithmetic_mean, :average
    alias_method :median, :average

    # Provides a sum of all the durations
    def total
      items.inject(0.0) do |sum, duration|
        sum += duration.to_f if duration.respond_to?(:to_f)
      end
    end

    # Tells us what the smallest duration is of the given ones
    def min
      items.map(&:to_f).min
    end

    # Tells us what the largest duration is of the given ones
    def max
      items.map(&:to_f).max;
    end

    # Variance is an average of the sum of differences between an actual value
    # and the mean value
    def variance
      if items.empty?
        0
      else
        mean = average # Cache the average for future use
        diffs = items.map { |duration| duration.to_f - mean.to_f }
        diff_squares = diffs.map { |diff| diff**2 }
        diff_squares.inject(:+) / items.size
      end
    end

    # The standard deviation is simply the square root of the variance
    def standard_deviation
      Math.sqrt(variance)
    end

    private

    # Calculates the average of the time as a float
    def avg_as_f
      if items.empty?
        0.0
      else
        total / items.size
      end
    end
  end
end
