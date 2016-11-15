require 'httparty'

module Contrast
  module UserApi
    class TagsApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version
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

      def application_tags_list 
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



    end
  end
end
