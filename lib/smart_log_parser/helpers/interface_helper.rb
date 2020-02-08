require_relative '../exceptions/smart_log_parser_exception'

module SmartLogParser
  module InterfaceHelper
    def self.included(base)
      base.extend(InterfaceHelper)
    end

    protected

      def not_implemented_error(class_name, method = '')
        raise SmartLogParser::SmartLogParserException.new "#{class_name} method #{method} not implemented"
      end
  end
end
