require_relative '../exceptions/smart_log_parser_exception'
require_relative '../helpers/interface_helper'

module SmartLogParser
  class SmartLogGrouper

    def initialize(reader)
      @reader = reader
    end

    def group
    end
  end
end
