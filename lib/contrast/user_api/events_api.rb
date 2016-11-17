module Contrast
  module UserApi  
    class EventsApi
      include HTTParty
      include ApiSupport

      attr_reader :version

      def initialize version = "ng"
        @version = version  
      end

      def events limit = nil
        params = query_params(nil, nil, nil, limit)
        self.class.get(path("events"), { query: params }) do |response|
          # TODO: build ActivityResponse
        end
      end

      def events_application limit = nil
        params = query_params(nil, nil, nil, limit)
        self.class.get(path("events/application"), { query: params }) do |response|
          # TODO: build ActivityResponse
        end
      end

      def events_server limit = nil
        params = query_params(nil, nil, nil, limit)
        self.class.get(path("events/server"), { query: params }) do |response|
          # TODO: build ActivityResponse
        end
      end

      def events_trace limit = nil
        params = query_params(nil, nil, nil, limit)
        self.class.get(path("events/trace"), { query: params }) do |response|
          # TODO: build ActivityResponse
        end
      end
    end
  end
end
