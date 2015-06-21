Continuance
===========

Continuance is a library for handling duration as opposed to absolute time.
At present the minimum resolution for measuring duration in Continuance is in hours, with
the maximum resolution being a nanosecond.

Current Build Status:
[ ![Codeship Status for shirren/continuance](https://codeship.com/projects/c20de200-f6d0-0132-1815-2e788669a94e/status?branch=master)](https://codeship.com/projects/86171)

## Installation

The continuance gem runs with all Ruby versions >= 1.9.3.

```ruby
gem 'continuance'
```

## Example

To create a duration of 1 hour is simply.

```ruby
Continuance::Duration.new(1, 0, 0, 0)
```

or with a named argument.

```ruby
Continuance::Duration.new(hours = 1)
```

To create a duration of 1 hour and 5 minutes is simply.

```ruby
Continuance::Duration.new(1, 5, 0, 0)
```

Once again named arguments can be used if preferred. Now to create a more complex duration of 1 hour, 10 minutes, 23.005 seconds.

```ruby
Continuance::Duration.new(1, 10, 23, 5_000_000)
```

As we can see the 4th argument of the constructor takes the point second value as a measure nanoseconds. Continuance only supports unsigned whole numbers for each unit. If there is a need to support signed floating point numbers we will look into it.

## Math Operations

Duration objects support the math operation `+` and `-`. So a duration object can be either be added to another or subtracted from another. The result of each of these operations is another duration object.

For example to add a duration of 1 hour 5 minutes to 6 minutes 32 seconds we can write the following code.

 ```ruby
Continuance::Duration.new(1, 0, 5, 0) + Continuance::Duration.new(0, 0, 6, 32)
```

## Collection Operations

### Total & average

At present Continuance provides `total` and `average` aggregate operations on a collection of duration objects. The Ruby code below demonstrates how to use these collection operations.

 ```ruby
duration1 = Continuance::Duration.new(1, 0, 5, 0)
duration2 = Continuance::Duration.new(0, 0, 6, 32)
durations = Continuance::Duration.new([duration1, duration2])
average = durations.average
total = durations.total
```

The average method returns a Duration object, where as total returns the total number of seconds as a floating point value, this could change in the future. The order of complexity of both operations is `O(n)`.

### Min & Max

The library also supports retrieving minimum and maximum functions for a collection of durations. Like the total and average operations, the order of complexity of the min and max operation is `O(n)`.

Report bugs on GitHub.
