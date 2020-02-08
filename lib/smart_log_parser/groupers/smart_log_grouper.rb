require_relative '../exceptions/smart_log_parser_exception'
require_relative '../helpers/interface_helper'

module SmartLogParser
  class SmartLogGrouper
    include SmartLogParser::InterfaceHelper

    def initialize(reader)
      raise SmartLogParser::SmartLogParserException.new 'Reader must exist!' if reader.nil?
      raise SmartLogParser::SmartLogParserException.new 'Reader must respond to method read_lines!' unless reader.class.method_defined?(:read_lines)
      @reader = reader
    end

    def group
      self.not_implemented_error(self.class.name, __callee__)
    end

    def self.description
      not_implemented_error(self.name, __callee__)
    end

    def self.follower_text
      not_implemented_error(self.name, __callee__)
    end
  end
end
