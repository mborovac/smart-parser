require_relative '../exceptions/smart_log_parser_exception'
require_relative '../helpers/interface_helper'

module SmartLogParser
  class SmartLogOrderer
    include SmartLogParser::InterfaceHelper

    def initialize(data)
      raise SmartLogParser::SmartLogParserException.new 'Data must exist!' if (data.nil? || data.empty?)
      @data = data
    end

    def order
      not_implemented_error(self.class.name, __callee__)
    end
  end
end
