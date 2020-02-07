require_relative '../../../lib/smart_log_parser/exceptions/smart_log_parser_exception'
require_relative '../../../lib/smart_log_parser/io/line_by_line_reader'

RSpec.describe 'line by line reader' do
  describe 'read lines' do
    it 'raises exception if log file does not exist' do
      log_file_path = 'some_random_file.log'
      reader = SmartLogParser::LineByLineReader.new(log_file_path)
      expect{ reader.read_lines }.to raise_exception(SmartLogParser::SmartLogParserException, "File #{log_file_path} does not exist.")
    end
  end
end
