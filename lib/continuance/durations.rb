# Durations takes a collection of duration objects on which some standard
# collection operations can be performed such as average etc
module Continuance
  class Durations
    attr_reader :items

    def initialize(items = [])
      @items = items
    end
  end
end
