require 'httparty'

module Contrast
  module UserApi
    class LibrariesApi
      include HTTParty
      include ApiSupport

      attr_reader :version

      def initialize version = "ng"
        @version = version  
      end

      def libraries quick_filter = nil, expand = nil
        params = query_params(expand, nil, nil, nil)
        params[:quickFilter] = quick_filter unless quick_filter.nil?
        self.class.get(path("libraries"), { query: params }) do |response|
          # TODO: build LibrariesResponse
        end
      end

      def libraries_filter apps = nil, servers = nil, tags = nil, q = nil, quick_filter = nil, expand = nil 
        params = query_params(expand, nil, nil, nil)
        params[:apps] = Array(apps) unless apps.nil?
        params[:servers] = Array(servers) unless servers.nil?
        params[:tags] = Array(tags) unless tags.nil?
        params[:q] = q unless q.nil?
        params[:quickFilter] = quick_filter unless quick_filter.nil?
        self.class.get(path("libraries/filter"), { query: params }) do |response|
          # TODO: build LibrariesReponse
        end
      end

      def dotnet_libraries hash, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(path("libraries/dotnet/#{ hash }"), { query: params }) do |response|
          # TODO: build LibrariesResponse
        end
      end

      def java_libraries hash, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(path("libraries/java/#{ hash }"), { query: params }) do |response|
          # TODO: build LibrariesResponse
        end
      end

      def libraries_subfilter subfilter = nil
        self.class.get(path("libraries/filters/#{ subfilter }/listing")) do |response|
          # TODO: build LibraryFilterCatalogDetailsResponse
        end 
      end

      def libraries_stats 
        self.class.get(path("libraries/stats")) do |response|
          # TODO: build LibrariesStatsResponse
        end
      end
    end
  end
end
