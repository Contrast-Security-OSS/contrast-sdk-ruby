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
    end
  end
end
