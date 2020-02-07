require_relative '../../../lib/smart_log_parser/exceptions/smart_log_parser_exception'
require_relative '../../../lib/smart_log_parser/io/line_by_line_reader'

RSpec.describe 'line by line reader' do
  describe 'read lines' do
    it 'raises exception if log file does not exist' do
      non_existing_file_path = 'some_random_file.log'
      reader = SmartLogParser::LineByLineReader.new(non_existing_file_path)
      expect{ reader.read_lines }.to raise_exception(SmartLogParser::SmartLogParserException, "File #{non_existing_file_path} does not exist.")
    end

    it 'reads the file line-by-line, splits the string by whitespace and yields execution to the caller method block' do
      log_file_path = 'spec/reader_spec.log'
      reader = SmartLogParser::LineByLineReader.new(log_file_path)
      expected_output_string = [
        "page: /page_one, address: 123.123.123.123",
        "page: /page_two, address: 456.456.456.456",
        "page: /page_three, address: 123.123.123.123"
      ].join("\n")
      read_lines_array = []
      reader.read_lines{|page, address| read_lines_array << "page: #{page}, address: #{address}" }

      expect(read_lines_array.join("\n")).to eql(expected_output_string)
    end
  end
end
