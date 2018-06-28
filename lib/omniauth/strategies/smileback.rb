# frozen_string_literal: true

require 'omniauth-oauth2'
require 'smileback/configuration'

module OmniAuth
  module Strategies
    class Smileback < OmniAuth::Strategies::OAuth2
      option :name, 'smileback'

      option :client_options, {
        site:  ENV['SMILEBACK_SITE'],
        authorize_url: ENV['SMILEBACK_AUTHORIZATION_URL'],
        token_url: ENV['SMILEBACK_TOKEN_URL']
      }

      uid { raw_info['id'] }

      info do
        {
          name: raw_info['name'],
          email: raw_info['email']
        }
      end
    end
  end
end
