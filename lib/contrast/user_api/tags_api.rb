require 'httparty'

module Contrast
  module UserApi
    class TagsApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version = "ng"
        @version = version
      end

      def tags_by_application app_id 
        self.class.get(path("tags/application/list/#{ app_id }")) do |response|
          # TODO: TagsResponse
        end
      end

      def delete_application_tags app_id
        self.class.delete(path("tags/application/#{ app_id }")) do |response|
          # TODO: TagsResponse
        end
      end

      def update_tag_applications resource
        expect_class!(resource, Contrast::UserApi::TagsServersResource)
        self.class.put(path("tags/applications"), { body: resource }) do |response|
          # TODO: BaseApiResponse
        end
      end

      def create_tag_applications_bulk resource
        expect_class!(resource, Contrast::UserApi::TagsApplicationsRequest)
        self.class.post(path("tags/applications/bulk"), { body: resource }) do |response|
          # TODO: TagsResponse
        end
      end

      def update_tag_applications_bulk resource
        expect_class!(resource, Contrast::UserApi::TagsApplicationsUpdateRequest)
        self.class.put(path("tags/applications/bulk"), { body: resource }) do |response|
          # TODO: BaseApiResponse
        end
      end

      def applications_tags_list 
        self.class.get(path("tags/applications/list")) do |response|
          # TODO: TagsResponse
        end
      end

      def tag_libraries resource
        expect_class!(resource, Contrast::UserApi::TagsLibrariesResource)
        self.class.put(path("tags/libraries"), { body: resource }) do |response|
          # TODO: BaseApiResponse
        end
      end

      def create_tag_libraries_bulk resource
        expect_class!(resource, Contrast::UserApi::TagsLibrariesRequest)
        self.class.post(path("tags/libraries/bulk"), { body: resource }) do |response|
          # TODO: TagsResponse
        end
      end

      def update_tag_libraries_bulk resource
        expect_class!(resource, Contrast::UserApi::TagsTracesUpdateRequest)
        self.class.put(path("tags/libraries/bulk"), { body: resource }) do |response|
          # TODO: TagsResponse
        end
      end

      def tag_libraries_list
        self.class.get(path("tags/libraries/list")) do |response|

        end
      end

      def tags_libraries_for_application app_id
        self.class.get(path("tags/libraries/#{ app_id }/list")) do |response|

        end
      end

      def tags_libraries_by_hash hash
        params = query_params
        params[:hash] = hash
        self.class.get(path("tags/library/list/#{ hash }")) do |response|

        end
      end

      def delete_tags_libraries_by_hash hash
        self.class.delete(path("tags/library/list/#{ hash }")) do |response|

        end
      end

      def tags_libraries_by_server server_id
        self.class.get(path("tags/server/list/#{ server_id }")) do |response|

        end
      end

      def delete_tags_libraries_by_server server_id
        self.class.delete(path("tags/server/#{ server_id }")) do |response|

        end
      end

      def tag_servers resource
        expect_class!(resource, Contrast::UserApi::TagsServersResource)
        self.class.put(path("tags/servers"), { body: resource }) do |response|

        end
      end

      def create_tag_servers_bulk resource
        expect_class!(resource, Contrast::UserApi::TagsServersRequest)
        self.class.post(path("tags/servers/bulk"), { body: resource }) do |response|

        end
      end

      def update_tag_servers_bulk resource
        expect_class!(resource, Contrast::UserApi::TagsServersUpdateRequest)
        self.class.put(path("tags/servers/bulk"), { body: resource }) do |response|

        end
      end

      def tags_servers_list
        self.class.get(path("tags/servers/list")) do |response|

        end
      end
      
      def delete_tags_trace trace_uuid
        self.class.delete(path("tags/trace/#{ trace_uuid }")) do |response|

        end
      end

      def tags_traces
        self.class.get(path("tags/traces")) do |response|

        end
      end

      def update_tags_traces resource
        self.class.put(path("tags/traces"), { body: resource }) do |response|

        end
      end

      def unique_traces_by_application app_id
        self.class.get(path("tags/traces/application/#{ app_id }")) do |response|

        end
      end

      def create_tag_traces resource
        expect_class!(resource, Contrast::UserApi::TagsTracesRequest)
        self.class.post(path("tags/traces/bulk"), { body: resource }) do |response|

        end
      end

      def update_tag_traces resource
        expect_classs!(resource, Contrast::UserApi::TagsTracesUpdateRequest)
        self.class.put(path("tags/traces/bulk"), { body: resource }) do |response|

        end
      end

      def tags_traces_by_server server_id
        self.class.get(path("tags/traces/server/#{ server_id }")) do |response|

        end
      end

      def tags_by_trace trace_uuid
        self.class.get(path("tags/traces/trace/#{ trace_uuid }")) do |response|

        end
      end
    end
  end
end
