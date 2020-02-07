require_relative '../../../lib/smart_log_parser/exceptions/smart_log_parser_exception'
require_relative '../../../lib/smart_log_parser/groupers/smart_log_grouper'

RSpec.describe 'smart log grouper' do
  describe 'initialize' do
    it 'should raise an exception if given reader is not present' do
      expect{ SmartLogParser::SmartLogGrouper.new(nil) }.to raise_exception(SmartLogParser::SmartLogParserException, 'Reader must exist!')
    end

    it 'should raise an exception if given reader does not respond to method read_lines' do
      expect{ SmartLogParser::SmartLogGrouper.new(Class.new) }.to raise_exception(SmartLogParser::SmartLogParserException, 'Reader must respond to method read_lines!')
    end
  end
  describe 'as an interface-like class' do
    it 'has no implementation for "group" instance method' do
      file_path = 'spec/webserver_spec.log'
      reader = SmartLogParser::LineByLineReader.new(file_path)
      grouper_interface = SmartLogParser::SmartLogGrouper.new(reader)

      expect{ grouper_interface.group }.to raise_exception(SmartLogParser::SmartLogParserException, 'SmartLogParser::SmartLogGrouper method group not implemented')
    end
  end
end
