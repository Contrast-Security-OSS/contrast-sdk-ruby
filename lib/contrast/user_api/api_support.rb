module Contrast
  module UserApi
    module ApiSupport

      class PathIDError < RuntimeError
      end

      def org_uuid
        @_org_uuid ||= nil
      end

      def org_uuid= val
        @_org_uuid = val
      end

      def expect_class! instance, clazz
        unless instance.is_a?(clazz)
          raise ArgumentError.new("Expected #{ clazz.name } but got #{ instance.class.name }")
        end
      end

      def value_required! val, field = "Path"
        if val.nil? || val.to_s.empty?
          raise PathIDError.new("#{ field } is required for this endpoint")
        end
      end

      def org_uuid_required!
        if org_uuid.nil? || org_uuid.to_s.empty?
          raise PathIDError.new("Organization UUID is required for this endpoint")
        end
      end

      def query_params expand, archived, merged, limit
        params = {}
        params[:expand] = expand unless expand.nil?
        params[:includeArchived] = archived unless archived.nil?
        params[:includeMerged] = merged unless merged.nil?
        params[:limit] = limit.to_i unless limit.nil?
        params
      end

      def path path = nil
        org_uuid_required!
        value_required!(path)

        if path.nil?
          "/#{ version }/#{ org_uuid }/#{ path }"
        else
          "/#{ version }/#{ org_uuid }/#{ path }"
        end
      end

      def application_path app_id, sub = nil
        value_required!(app_id, "Application ID")

        if sub.nil?
          path("applications/#{ app_id }")
        else
          path("applications/#{ app_id }/#{ sub }")
        end
      end

      def traces_path app_id, sub = nil
        value_required!(app_id, "Application ID")

        if sub.nil?
          path("traces/#{ app_id }")
        else
          path("traces/#{ app_id }/#{ sub }")
        end
      end
    end
  end
end
