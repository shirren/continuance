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
    end

    context 'with multiple durations' do
      let(:duration1)  { Duration.new(1, 0, 0, 0) }
      let(:duration2)  { Duration.new(0, 1, 0, 0) }
      let(:duration3)  { Duration.new(0, 0, 1, 0) }
      let(:duration4)  { Duration.new(0, 0, 0, 1_000_000) }
      let(:durations) { Durations.new([duration1, duration2, duration3, duration4]) }

      it 'should be able to calculate the total' do
        expect(durations.total).to eq(3661.001)
      end

      it 'should be able to calculate an average' do
        expect(durations.average).to eq(Duration.new(0, 15, 15, 250_250_000))
      end
    end
  end
end
