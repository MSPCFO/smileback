# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Smileback < OmniAuth::Strategies::OAuth2
      option :name, 'smileback'

      option :client_options, {
        site:  ENV['SMILEBACK_SITE'],
        authorize_url: ENV['SMILEBACK_AUTHORIZATION_URL'],
        token_url: ENV['SMILEBACK_TOKEN_URL']
      }

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
