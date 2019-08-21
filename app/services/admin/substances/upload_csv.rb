require 'csv'

module Admin
  module Substances
    class UploadCSV
      attr_reader :csv

      def initialize(csv:)
        @csv = CSV.open(csv.tempfile)
      end

      def call
        csv.each do |row|
          service = ::Substances::Create.new(params: substance_params(row[0])).call
        end
      end

      private

      def substance_params(substance_name)
        {
          name: substance_name
        }
      end
    end
  end
end
