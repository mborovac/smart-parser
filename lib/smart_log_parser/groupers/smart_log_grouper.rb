require_relative '../exceptions/smart_log_parser_exception'
require_relative '../helpers/interface_helper'

module SmartLogParser
  class SmartLogGrouper
    include SmartLogParser::InterfaceHelper

    def initialize(reader)
      @reader = reader
    end

    def group
      not_implemented_error(self.class.name, __callee__)
    end
  end
end
