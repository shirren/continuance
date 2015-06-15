require 'time'

# To calculate duration in Ruby we need to calculate time
# differences, but in Ruby when you are dealing with finer units
# like days, hours, minutes etc we need to make sure the base YY-MM-DD is
# set to 1970-01-01 to remove potential errors
class BaseDate
  attr_reader :val

  def initialize
    @val = Time.new(1970, 1, 1)
  end
end
