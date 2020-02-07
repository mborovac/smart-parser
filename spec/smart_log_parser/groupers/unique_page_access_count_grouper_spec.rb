require 'spec_helper'

RSpec.describe 'unique page access count grouper' do
  it 'should extend smart_log_grouper' do
    expect(SmartLogParser::UniquePageAccessCountGrouper < SmartLogParser::SmartLogGrouper)
  end

  it 'should group unique visits by page and count them' do
    file_path = 'spec/webserver_spec.log'
    reader = SmartLogParser::LineByLineReader.new(file_path)
    grouper = SmartLogParser::UniquePageAccessCountGrouper.new(reader)
    expected_result = {
      "/page_one" => 2,
      "/page_one/1" => 1,
      "/page_one/2" => 1,
      "/page_three" => 2,
      "/page_two" => 2,
      "/page_two/something/extra" => 1
    }

    expect(grouper.group).to eql(expected_result)
  end
end
