require 'httparty'

module Contrast
  module UserApi
    class TracesApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version
        @version = version
      end

      def delete_trace_set resource
        expect_class!(resource, Contrast::UserApi::TraceBaseRequest)
        self.class.delete(path("orgtaces"), { body: resource }) do |response|

        end
      end

      def export_traces_csv request = nil
        params = query_params(nil, nil, nil, nil)
        params[:request] = request unless request.nil?
        self.class.post(path("orgtraces/export/csv"), { query: params }) do |response|

        end
      end

      def export_all_traces_csv request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?
        params[:request] = request unless request.nil?
        self.class.post(path("orgtraces/export/csv/all"), { query: params }) do |response|

        end
      end

      def export_traces_xml request = nil
        params = query_params(nil, nil, nil, nil)
        params[:request] = request unless request.nil?
        self.class.post(path("orgtraces/export/xml"), { query: params }) do |response|

        end
      end

      def export_all_traces_xml request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?
        params[:request] = request unless request.nil?
        self.class.post(path("orgtraces/export/xml/all"), { query: params }) do |response|

        end
      end

      def orgtraces_ids request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?
        params[:request] = request unless request.nil?
        self.class.get(path("orgtraces/ids"), { query: params }) do |response|

        end
      end

      def orgtraces_with_policy_violations 
        self.class.get(path("orgtraces/policy/violations")) do |response|

        end
      end

      def orgtraces_quick_filters request = nil
        params = query_params(nil, nil, nil, nil)
        params[:request] = request unless request.nil?
        self.class.get(path("orgtraces/quick"), { query: params }) do |response|

        end
      end

      def delete_orgtrace trace_uuid
        self.class.delete(path("orgtraces/trace/#{ trace_uuid }")) do |response|

        end
      end

      def export_traces_filter_and_keycode_csv filter_type, keycode, form = nil, sort = ni
        params = query_params(nil, nil, nil, nil)
        params[:form] = form unless form.nil?
        params[:sort] = sor unless sort.nil?
        self.class.post(path("orgtraces/#{ filter_type }/#{ keycode }/csv"), { query: params }) do |response|

        end
      end

      def export_traces_filter_and_keycode_xml filter_type, keycode, form = nil, sort = ni
        params = query_params(nil, nil, nil, nil)
        params[:form] = form unless form.nil?
        params[:sort] = sor unless sort.nil?
        self.class.post(path("orgtraces/#{ filter_type }/#{ keycode }/xml"), { query: params }) do |response|

        end
      end

    end
  end
end
