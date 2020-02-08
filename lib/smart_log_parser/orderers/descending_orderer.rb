require_relative 'smart_log_orderer'

module SmartLogParser
  class DescendingOrderer < SmartLogOrderer
    def order
      @data.sort_by{|k, v| -v}
    end

    def self.direction_text
      'descending order'
    end
  end
end
