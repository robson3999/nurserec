module Substances
  class Create
    attr_reader :params

    def initialize(params:)
      @params = params
    end

    def call
      return substance if substance.present?

      new_substance = Substance.new(params)
      return 'failure' unless new_substance.save

      new_substance
    end

    private

    def substance
      Substance.find_by(name: params[:name])
    end
  end
end