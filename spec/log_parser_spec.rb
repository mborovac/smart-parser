require_relative '../lib/smart_log_parser/exceptions/smart_log_parser_exception'
require_relative '../lib/smart_log_parser/log_parser'

RSpec.describe 'log parser' do
  describe 'creation' do
    it 'raises exception if log file is nil' do
      expect{ SmartLogParser::LogParser.new(nil) }.to raise_exception(SmartLogParser::SmartLogParserException, 'No log file given!')
    end

    it 'raises exception if log file is an empty string' do
      expect{ SmartLogParser::LogParser.new('') }.to raise_exception(SmartLogParser::SmartLogParserException, 'No log file given!')
    end
  end
end
