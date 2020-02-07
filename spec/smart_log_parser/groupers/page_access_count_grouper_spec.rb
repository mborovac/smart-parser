require 'spec_helper'

RSpec.describe 'page access count grouper' do
  it 'should extend smart_log_grouper' do
    file_path = 'spec/webserver_spec.log'
    reader = SmartLogParser::LineByLineReader.new(file_path)
    grouper = SmartLogParser::PageAccessCountGrouper.new(reader)

    expect(SmartLogParser::PageAccessCountGrouper < SmartLogParser::SmartLogGrouper)
  end

  it 'should group visits by page and count them' do
    file_path = 'spec/webserver_spec.log'
    reader = SmartLogParser::LineByLineReader.new(file_path)
    grouper = SmartLogParser::PageAccessCountGrouper.new(reader)
    expected_result = {
      "/page_one" => 2,
      "/page_one/1" => 1,
      "/page_one/2" => 1,
      "/page_three" => 2,
      "/page_two" => 5,
      "/page_two/something/extra" => 1
    }

    expect(grouper.group).to eql(expected_result)
  end
end
