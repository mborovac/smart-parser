require 'spec_helper'

RSpec.describe 'log parser' do
  describe 'creation' do
    it 'raises exception if log file is nil' do
      expect{ SmartLogParser::LogParser.new(nil, []) }.to raise_exception(SmartLogParser::SmartLogParserException, 'No log file given!')
    end

    it 'raises exception if log file is an empty string' do
      expect{ SmartLogParser::LogParser.new('', []) }.to raise_exception(SmartLogParser::SmartLogParserException, 'No log file given!')
    end

    it 'splits the group and order params by predefined value' do
      options_array = ['PAC-down', 'UPAC-up']
      split_char = SmartLogParser::LogParser::GROUP_AND_ORDER_SPLIT_CHAR

      parser = SmartLogParser::LogParser.new('webserver_spec.log', options_array)
      expect(parser.group_and_order_array).to eq(options_array.map{|gao| gao.split(split_char)})
    end

    it 'sets the default group and order value to predefined array' do
      default_options_array = SmartLogParser::LogParser::DEFAULT_GROUP_AND_ORDER
      split_char = SmartLogParser::LogParser::GROUP_AND_ORDER_SPLIT_CHAR

      parser = SmartLogParser::LogParser.new('webserver_spec.log', [])
      expect(parser.group_and_order_array).to eq(default_options_array.map{|gao| gao.split(split_char)})
    end
  end

  describe 'webserver parsing' do
    it 'reads the file, groups and orders the data, and prints it to STDOUT' do
      follower_text = 'views'
      expected_output = [
        'List of webpage views ordered in descending order',
        "/page_two 5 #{follower_text}",
        "/page_one 3 #{follower_text}",
        "/page_three 2 #{follower_text}",
        "/page_one/1 1 #{follower_text}",
        "/page_one/2 1 #{follower_text}",
        "/page_two/something/extra 1 #{follower_text}",
        "#{SmartLogParser::LogParserPrinter::DELIMITER}\n"
      ].join("\n")

      parser = SmartLogParser::LogParser.new('spec/webserver_spec.log', ['PAC-down'])
      expect{ parser.parse }.to output(expected_output).to_stdout
    end
  end
end
