require 'spec_helper'
require 'continuance/duration'

# Specs for bullet points
module Continuance
  describe Duration do
    it 'should be able to measure Duration to a nanosecond' do
      duration = Duration.create('00:00.000000001', '%H:%M.%N')
      expect(duration.nano_seconds).to eq(1)
    end

    it 'should be able to measure Duration to a microsecond' do
      duration = Duration.create('00:00.0000001', '%H:%M.%N')
      expect(duration.nano_seconds).to eq(100)
    end

    it 'should be able to measure Duration to a millisecond' do
      duration = Duration.create('00:00.001', '%H:%M.%L')
      expect(duration.nano_seconds).to eq(100_000_0)
    end

    it 'should be able to measure Duration to a nanosecond' do
      duration = Duration.create('00:00.000000001', '%H:%M.%L')
      expect(duration.nano_seconds).to eq(1)
    end

    it 'should be able to measure Duration to a second' do
      duration = Duration.create('00:00.1', '%H:%M.%S')
      expect(duration.seconds).to eq(1)
    end

    it 'should be able to measure Duration to a minute' do
      duration = Duration.create('00:01:00', '%H:%M:%S')
      expect(duration.minutes).to eq(1)
      expect(duration.hours).to eq(0)
      expect(duration.seconds).to eq(0)
    end

    it 'should be able to measure Duration to a hour' do
      duration = Duration.create('01:00:00', '%H:%M:%S')
      expect(duration.minutes).to eq(0)
      expect(duration.hours).to eq(1)
      expect(duration.seconds).to eq(0)
    end

    it 'should be subtractable from a lesser duration' do
      duration1 = Duration.create('00:00:02', '%H:%M:%S')
      duration2 = Duration.create('00:00:03', '%H:%M:%S')
      expect(duration2 - duration1).to eq(1.0)
    end

    it 'should be subtractable from a duration with a different resolution' do
      duration1 = Duration.create('00:00:00.005', '%H:%M:%S.%N')
      duration2 = Duration.create('00:00:01', '%H:%M:%S')
      expect(duration2 - duration1).to eq(0.995)
    end

    it 'should be subtractable from a duration with a vastly different resolution' do
      duration1 = Duration.create('00:00:00.005', '%H:%M:%S.%N')
      duration2 = Duration.create('00:01:00', '%H:%M:%S')
      expect(duration2 - duration1).to eq(59.995)
    end

    it 'should be addable to a lesser duration' do
      duration1 = Duration.create('00:00:02', '%H:%M:%S')
      duration2 = Duration.create('00:00:03', '%H:%M:%S')
      expect(duration2 + duration1).to eq(5.0)
    end

    it 'should be addable to a duration with a different resolution' do
      duration1 = Duration.create('00:00:00.005', '%H:%M:%S.%N')
      duration2 = Duration.create('00:00:01', '%H:%M:%S')
      expect(duration2 + duration1).to eq(1.005)
    end

    it 'should be addable to a duration with a vastly different resolution' do
      duration1 = Duration.create('00:00:00.005', '%H:%M:%S.%N')
      duration2 = Duration.create('00:01:00', '%H:%M:%S')
      expect(duration2 + duration1).to eq(60.005)
    end

    context 'with a lesser value' do
      let(:duration1) { Duration.new(0, 0, 0, 100) }
      let(:duration2) { Duration.new(0, 0, 0, 101) }

      it 'should report as so when compared' do
        expect(duration1).to be < duration2
      end
    end

    context 'with an equal value' do
      let(:duration1) { Duration.new(0, 0, 0, 100) }
      let(:duration2) { Duration.new(0, 0, 0, 100) }

      it 'should report as so when compared' do
        expect(duration1).to eql(duration2)
      end
    end

    context 'with a greater value' do
      let(:duration1) { Duration.new(0, 0, 0, 101) }
      let(:duration2) { Duration.new(0, 0, 0, 100) }

      it 'should report as so when compared' do
        expect(duration1).to be > duration2
      end
    end
  end
end
