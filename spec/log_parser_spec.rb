require 'spec_helper'

RSpec.describe 'log parser' do
  describe 'creation' do
    it 'raises exception if log file is nil' do
      expect{ SmartLogParser::LogParser.new(nil) }.to raise_exception(SmartLogParser::SmartLogParserException, 'No log file given!')
    end

    it 'raises exception if log file is an empty string' do
      expect{ SmartLogParser::LogParser.new('') }.to raise_exception(SmartLogParser::SmartLogParserException, 'No log file given!')
    end
  end

  describe 'webserver parsing' do
    it 'reads the file, groups and orders the data, and prints it to STDOUT' do
      description = 'LogParserPrinter test description'
      ordering_description = 'ascending order'
      follower_text = 'views'
      expected_output = [
        "#{description} ordered in #{ordering_description}",
        "/page_two 5 #{follower_text}",
        "/page_one 3 #{follower_text}",
        "/page_three 2 #{follower_text}",
        "/page_one/1 1 #{follower_text}",
        "/page_one/2 1 #{follower_text}",
        "/page_two/something/extra 1 #{follower_text}",
        "#{SmartLogParser::LogParserPrinter::DELIMITER}\n"
      ].join("\n")

      parser = SmartLogParser::LogParser.new('spec/webserver_spec.log')
      expect{ parser.parse(description, follower_text, ordering_description) }.to output(expected_output).to_stdout
    end
  end
end
