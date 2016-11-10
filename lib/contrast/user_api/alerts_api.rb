module Contrast
  module UserApi
    class AlertsApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version
        @version = version
      end

      def alerts 
        self.class.get(path("alerts")) do |response|
          # TODO: AlertsResponse
        end
      end

      def alert alert_id
        self.class.get(path("alerts/#{ alert_id }")) do |response|
          # TODO: AlertResponse
        end
      end
    end
  end
end
