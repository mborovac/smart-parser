require_relative 'smart_log_orderer'

module SmartLogParser
  class AscendingOrderer < SmartLogOrderer
    def order
      @data.sort_by{|_k, v| v}
    end

    def self.direction_text
      'ascending order'
    end
  end
end
