Dir[File.join(__dir__, '*.rb')].each { |file| require file }

module SmartLogParser
  class OrdererFactory
    ORDERER_MAPPER = {
      up: AscendingOrderer,
      down: DescendingOrderer
    }

    def create_orderer(data, order)
      order = order.to_sym
      raise SmartLogParserException.new("Unknown ordering option #{order}. Run 'rake man:orderer_options' to get a list of all available ordering options.") unless ORDERER_MAPPER.keys.include?(order)

      ORDERER_MAPPER[order].new(data)
    end
  end
end
