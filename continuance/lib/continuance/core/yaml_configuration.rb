require 'singleton'
require 'yaml'

module Continuance
  module Core
    # The configuration class abstracts access to the underlying YAML file
    class YamlConfiguration
      include Singleton

      # If the configuration loader fails for any reason then just
      # return an empty hash
      def load(configuration_key)
        config_file_path = File.join(Rails.root, "config/#{configuration_key}.yml")
        YAML.load_file(config_file_path)[Rails.env]
        rescue
          {}
      end
    end
  end
end
