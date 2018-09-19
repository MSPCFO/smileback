# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Smileback < OmniAuth::Strategies::OAuth2
      option :name, 'smileback'

      option :client_options, {
        site:  ENV['SMILEBACK_SITE'] || 'https://www.smileback.io',
        authorize_url: ENV['SMILEBACK_AUTHORIZATION_URL'] || 'https://app.smileback.io/account/api/authorize/',
        token_url: ENV['SMILEBACK_TOKEN_URL'] || 'https://api.smileback.io/token/'
      }

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
