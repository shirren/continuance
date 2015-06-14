require 'spec_helper'
require 'continuance/core/yaml_configuration'

# Specs for bullet points
module Continuance
  # Specs for yaml configuration
  module Core
    describe YamlConfiguration do
      it 'should be able to handle missing configuration files' do
        YamlConfiguration.instance.load('dummy')
      end
    end
  end
end
