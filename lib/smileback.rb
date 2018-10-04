require 'oauth2'
require 'httparty'
require 'smileback/version'
require 'smileback/configuration'
require 'omniauth/strategies/smileback'

module Smileback
  class Client
    include HTTParty

    debug_output $stdout

    attr_accessor :access_token

    def initialize(token:, refresh_token:, expires_at:, expires: true)
      self.class.base_uri Smileback.configuration.api_base_url

      @access_token = OAuth2::AccessToken.new(
        oauth2_client,
        token, { expires_at: expires_at, refresh_token: refresh_token }
      )
    end

    # Latest OAuth2 credentials based on access_token.  The original token may need to be refreshed during usage,
    # so always check here for the latest values when finished.
    #
    # @return [Hash]
    def credentials
      {
        token: access_token.token,
        refresh_token: access_token.refresh_token,
        expires_at: access_token.expires_at,
        expires: true
      }
    end

    # Make a GET request to the API.
    #
    # @param path [String] endpoint; '/v3/reviews/'
    # @param query [Hash] query params; { modified_since: '2017-10-27T07:43:15Z' }
    # @return [HTTParty::Response]
    def get(path, query = {})
      refresh_access_token

      self.class.get(path, {
        headers: { Authorization: "Bearer #{access_token.token}" },
        query: query
      })
    end

    private

      def oauth2_client
        @oauth2_client ||= OAuth2::Client.new(
          Smileback.configuration.client_id,
          Smileback.configuration.client_secret, {
            token_url: "#{Smileback.configuration.api_base_url}/token/"
          }
        )
      end

      def refresh_access_token
        self.access_token = access_token.refresh! if access_token.expired?
      end
  end
end
