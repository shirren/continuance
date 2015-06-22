require 'spec_helper'
require 'continuance/duration'
require 'continuance/durations'

# Specs for Continuance durations
module Continuance
  describe Durations do
    context 'with an empty collection' do
      let(:durations) { Durations.new }

      it 'should be able to calculate the total' do
        expect(durations.total).to eq(0.0)
      end

      it 'should be able to calculate an average' do
        expect(durations.average).to eq(Duration.new)
      end

      it 'should be able to extract the minimum' do
        expect(durations.min).to be_nil
      end

      it 'should be able to extract the maximum' do
        expect(durations.max).to be_nil
      end

      it 'should be able to calculate the variance' do
        expect(durations.variance).to eq(0.0)
      end

      it 'should be able to calculate the standard deviation' do
        expect(durations.standard_deviation).to eq(0.0)
      end
    end

    context 'with a single duration' do
      let(:duration)  { Duration.new(1, 1, 1, 0) }
      let(:durations) { Durations.new([duration]) }

      it 'should be able to calculate the total' do
        expect(durations.total).to eq(3661.0)
      end

      it 'should be able to calculate an average' do
        expect(durations.average).to eq(Duration.new(1, 1, 1, 0))
      end

      it 'should be able to extract the minimum' do
        expect(durations.min).to eq(Duration.new(1, 1, 1, 0))
      end

      it 'should be able to extract the maximum' do
        expect(durations.max).to eq(Duration.new(1, 1, 1, 0))
      end
    end

    context 'with multiple durations' do
      let(:duration1)  { Duration.new(1, 0, 0, 0) }
      let(:duration2)  { Duration.new(0, 1, 0, 0) }
      let(:duration3)  { Duration.new(0, 0, 1, 0) }
      let(:duration4)  { Duration.new(0, 0, 0, 1_000_000) }
      let(:durations)  { Durations.new([duration1, duration2, duration3, duration4]) }

      it 'should be able to calculate the total' do
        expect(durations.total).to eq(3661.001)
      end

      it 'should be able to calculate an average' do
        expect(durations.average).to eq(Duration.new(0, 15, 15, 250_250_000))
      end

      it 'should be able to extract the minimum' do
        expect(durations.min).to eq(Duration.new(0, 0, 0, 1_000_000))
      end

      it 'should be able to extract the maximum' do
        expect(durations.max).to eq(Duration.new(1, 0, 0, 0))
      end

      it 'should alias arithmetic mean to average' do
        expect(durations.arithmetic_mean).to eq(durations.average)
      end

      it 'should alias median to average' do
        expect(durations.median).to eq(durations.average)
      end
    end

    context 'like the six side of a dice' do
      let(:side1)  { Duration.new(0, 0, 1, 0) }
      let(:side2)  { Duration.new(0, 0, 2, 0) }
      let(:side3)  { Duration.new(0, 0, 3, 0) }
      let(:side4)  { Duration.new(0, 0, 4, 0) }
      let(:side5)  { Duration.new(0, 0, 5, 0) }
      let(:side6)  { Duration.new(0, 0, 6, 0) }
      let(:sides)  { Durations.new([side1, side2, side3, side4, side5, side6]) }

      it 'should be able to calculate the variance' do
        expect(sides.variance).to eq(2.9166666666666665)
      end

      it 'should be able to calculate the standard deviation' do
        expect(sides.standard_deviation).to eq(1.707825127659933)
      end
    end
  end
end
