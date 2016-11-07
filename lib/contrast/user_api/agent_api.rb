require 'httparty'

module Contrast
  module UserApi
    class AgentApi
      include HTTParty

      attr_reader :version

      attr_accessor :organization_uuid

      def initialize version = "ng"
        @version = version  
      end

      def profiles expand = false
        params = expand ? { query: { expand: true } } : {}
        self.class.get(path('profiles'), params)
      end

      def profile name, expand = false
        params = expand ? { query: { expand: true } } : {}
        self.class.get(path("profiles/#{ name }"), params)
      end

      def create_profile agent_profile_request
        expect_class!(agent_profile_request, Contrast::UserApi::AgentProfileRequest)

        body = { body: agent_profile_request.to_hash }
        self.class.post(path('profiles'), body)
      end

      def update_profile name, agent_profile_request
        expect_class!(agent_profile_request, Contrast::UserApi::AgentProfileRequest)

        body = { body: agent_profile_request.to_hash }
        self.class.put(path("profiles/#{ name }"), body)
      end

      def versions 
        self.class.get(path("profiles/versions"))
      end

      def agent name, platform
        self.class.get(path("profiles/#{ name }/#{ platform }"))
      end

      private

        def expect_class! instance, clazz
          unless agent_profile_request.is_a?(instance, clazz)
            raise ArgumentError.new("Expected #{ clazz.name } instance")    
          end
        end

        def organization_uuid_required!
          if organization_uuid.nil? || organization_uuid.empty?
            raise "Organization UUID is required for this endpoint"     
          end
        end

        def path path 
          organization_uuid_required!

          "/#{ version }/#{ organization_uuid }/agents/#{ path }"
        end
    end
  end
end

