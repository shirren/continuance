require 'spec_helper'
require 'continuance/durations'

# Specs for Continuance durations
module Continuance
  describe Durations do
    context 'with an empty collection' do
      let(:durations) { Durations.new }

      it 'should be able to calculate an average' do
        expect(durations.average).to eq(Duration.new)
      end
    end
  end
end
