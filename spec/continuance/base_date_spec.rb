require 'spec_helper'
require 'continuance/base_date'

# Specs for bullet points
module Continuance
  describe BaseDate do
    let(:base_date) { BaseDate.new }

    it 'should always be set to 1970-01-01' do
      expect(base_date.val).to eq(Time.new(1970,1,1))
    end
  end
end
