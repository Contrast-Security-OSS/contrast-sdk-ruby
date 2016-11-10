require 'httparty'

module Contrast
  module UserApi
    class ModulesApi
      include HTTParty
      include ApiSupport

      attr_reader :version

      def initialize version = "ng"
        @version = version  
      end

      def modules expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(path("modules"), { query: params }) do |response|
          # TODO: build ModulesResponse
        end
      end

      def application_modules app_id, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(path("modules/#{ app_id }"), { query: params }) do |response|
          # TODO: build ApplicationsResponse
        end
      end
    end
  end
end
