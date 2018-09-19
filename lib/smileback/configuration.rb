module Smileback
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_base_url, :client_id, :client_secret

    def api_base_url
      @api_base_url || 'https://api.smileback.io'
    end
  end
end