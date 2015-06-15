# Module Continuance
module Continuance
  # Durations takes a collection of duration objects on which some standard
  # collection operations can be performed such as average etc
  class Durations
    attr_reader :items

    def initialize(items = [])
      @items = items
    end

    # Given a series of durations, this function calculates the average duration.
    def average
      total = items.inject(0.0) do |sum, duration|
        sum += duration.to_f if duration.respond_to?(:to_f)
      end
      if items.empty?
        avg = 0.0
      else
        avg = total / items.size
      end
      Duration.create(avg.to_s, '%S')
    end
  end
end
