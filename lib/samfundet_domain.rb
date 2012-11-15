require "active_support/configurable"
require "samfundet_domain/engine"

module SamfundetDomain
  include ActiveSupport::Configurable

  class << self
    def setup
      yield config

      database_path = "#{Rails.root}/config/database.yml"

      if File.exists? database_path
        database_config = YAML.load_file database_path

        if config.domain_database
          [Area, Group, GroupType].each do |model|
            model.establish_connection database_config[config.domain_database.to_s]
          end
        end
      end
    end
  end
end
