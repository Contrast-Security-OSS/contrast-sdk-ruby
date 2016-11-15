require 'httparty'

module Contrast
  module UserApi
    class WebhooksApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version
        @version = version
      end
    end
  end
end
