module Substances
  class Create
    attr_reader :params

    def initialize(params:)
      @params = params
    end

    def call
      return if substance_exists?

      substance = Substance.new(params)
      return 'failure' unless substance.save

      substance
    end

    private

    def substance_exists?
      Substance.find_by(name: params[:name]).present?
    end
  end
end