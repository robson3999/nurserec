module Medicaments
  class Create
    attr_reader :params

    def initialize(params:)
      @params = params
    end

    def call
      return medicament if medicament.present?

      new_medicament = Medicament.new(params)
      return 'failure' unless new_medicament.save

      new_medicament
    end

    private

    def medicament
      Medicament.find_by(ean: params[:ean])
    end
  end
end