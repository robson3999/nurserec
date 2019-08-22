require 'csv'

module Admin
  module Substances
    class UploadCSV
      attr_reader :csv, :status

      def initialize(params:)
        @csv = CSV.open(params[:file].tempfile)
        @status = params[:status]
      end

      def call
        csv.each do |row|
          service = ::Substances::Create.new(params: substance_params(row[0])).call
        end
      end

      private

      def substance_params(substance_name)
        {
          name: substance_name,
          status: status
        }
      end
    end
  end
end
