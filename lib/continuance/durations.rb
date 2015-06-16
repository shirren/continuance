# Module Continuance
module Continuance
  # Durations takes a collection of duration objects on which some standard
  # collection operations can be performed such as average etc
  class Durations
    attr_reader :items

    def initialize(items = [])
      @items = items
    end

    # Given a series of durations, this function calculates the average duration
    # by converting each duration to an absolute float value
    def average
      time = Time.at(avg_as_f).utc.strftime("%H:%M:%S:%N")
      Duration.create(time, '%H:%M:%S:%L')
    end

    # Provides a sum of all the durations
    def total
      items.inject(0.0) do |sum, duration|
        sum += duration.to_f if duration.respond_to?(:to_f)
      end
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
