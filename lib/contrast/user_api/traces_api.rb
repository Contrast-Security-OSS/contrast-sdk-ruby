require 'httparty'

module Contrast
  module UserApi
    class TracesApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version
        @version = version
      end

    end
  end
end
