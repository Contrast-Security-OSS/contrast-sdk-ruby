require 'httparty'

module Contrast
  module UserApi
    class ProfileApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version
        @version = version
      end

      def roles
        self.class.get(global_path("roles")) do |response|
          # TODO: build RolesResponse
        end
      end

      def profile
        self.class.get(global_path("profile")) do |response|
          # TODO: build UserResponse
        end
      end

      def update_profile profile
        expect_class!(profile, Contrast::UserApi::EditProfileRequest)
        self.class.put(global_path("profile"), { body: profile }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def update_expired_password password
        expect_class!(password, Contrast::UserApi::ExpiredPasswordRequest)
        self.class.put(global_path("profile/expired"), { body: password }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def update_password password
        expect_class!(password, Contrast::UserApi::PasswordProfileRequest)
        self.class.put(global_path("profile/password"), { body: password }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def password_policy
        self.class.get(global_path("profile/passwordpolicy")) do |response|
          # TODO: build PasswordPolicyResponse
        end
      end

      def user_roles
        self.class.get(global_path("profile/roles")) do |response|
          # TODO: build UserSettingsResponse
        end
      end

      def toggle_profile
        self.class.get(global_path("profile/toggle")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def report_preferences
        self.class.get(path("report/preferences")) do |response|
          # TODO: build UserReportPreferencesResponse
        end
      end

      def update_default_organization uuid
        self.class.put(global_path("profile/#{ uuid }/default")) do |response|
          # TODO: build OrganizationWithRolesResponse
        end
      end

      def allowed_organizations
        self.class.get(global_path("profile/organizations")) do |response|
          # TODO: build AllowedOrganizationsResponse
        end
      end

      def organization_by_uuid uuid
        self.class.get(global_path("profile/organizations/#{ uuid }")) do |response|
          # TODO: build OrganizationWithRolesResponse
        end
      end
    end
  end
end
