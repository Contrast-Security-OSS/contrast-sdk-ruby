require 'httparty'

module Contrast
  module UserApi
    class MessagesApi
      include HTTParty
      include ApiSupport

      attr_reader :version

      def initialize version = "ng"
        @version = version  
      end

      def messages
        self.class.get(global_path('messages')) do |response|
          # TODO: build SystemMessagesResponse
        end
      end

      def next_message
        self.class.get(global_path('messages/next')) do |response|
          # TODO: build NextSystemMessageResponse
        end
      end
    end
  end
end
