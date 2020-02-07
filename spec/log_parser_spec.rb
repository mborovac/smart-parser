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
end
