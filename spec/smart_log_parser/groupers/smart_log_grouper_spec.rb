require_relative '../../../lib/smart_log_parser/exceptions/smart_log_parser_exception'
require_relative '../../../lib/smart_log_parser/groupers/smart_log_grouper'

RSpec.describe 'smart log grouper' do
  describe 'as an interface-like class' do
    it 'has no implementation for "group" instance method' do
      grouper_interface = SmartLogParser::SmartLogGrouper.new(nil)
      expect{ grouper_interface.group }.to raise_exception(SmartLogParser::SmartLogParserException)
    end
  end
end
