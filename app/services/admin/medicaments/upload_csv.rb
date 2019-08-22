require 'csv'

module Admin
  module Medicaments
    class UploadCSV
      attr_reader :csv, :status

      def initialize(params:)
        @csv = CSV.open(params[:file].tempfile)
        @status = params[:status]
      end

      def call
        CSV.foreach(csv.path, col_sep: ';').with_index do |row, index|
          next if index == 0

          substance = ::Substances::Create.new(params: substance_params(row[1])).call
          ::Medicaments::Create.new(params: medicament_params(row, substance.id)).call
        end
      end

      private

       def substance_params(substance_name)
        {
          name: substance_name,
          status: status
        }
      end

      # postac i dawka
      def medicament_description(row)
        row_one = row[2].split(',')
        row_one[1..row_one.size].join(', ').strip
      end

      def medicament_params(row, substance_id)
        {
          name: row[2].split(',')[0],
          status: status,
          substance_ids: [substance_id],
          description: medicament_description(row),
          container: row[3],
          ean: row[4],
          decision_created_at: row[5],
          decision_period: row[6],
          limit_group: row[7],
          gov_price: row[8],
          gross_price: row[9],
          finance_limit: row[10],
          attachment_with_indication_name: row[11],
          payment_level: row[12],
          additional_payment: row[13]
        }
      end
    end
  end
end
