require_relative '../../../lib/smart_log_parser/exceptions/smart_log_parser_exception'
require_relative '../../../lib/smart_log_parser/helpers/interface_helper'

RSpec.describe 'interface helper' do
  include SmartLogParser::InterfaceHelper

  it 'not_implemented_error method raises an exception' do
    class_name = Class.name
    method_name = 'missing_method'
    expect{ not_implemented_error(class_name, method_name) }.to raise_exception(SmartLogParser::SmartLogParserException, "#{class_name} method #{method_name} not implemented")
  end
end
