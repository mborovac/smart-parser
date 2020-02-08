Dir[File.join(__dir__, '*.rb')].each { |file| require file }

module SmartLogParser
  class OrdererFactory
    ORDERER_MAPPER = {
      up: AscendingOrderer,
      down: DescendingOrderer
    }

    def create_orderer(data, order)
    end
  end
end
