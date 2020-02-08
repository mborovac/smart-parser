require 'spec_helper'

RSpec.describe 'unique page access count grouper' do
  it 'should extend smart_log_grouper' do
    expect(SmartLogParser::UniquePageAccessCountGrouper < SmartLogParser::SmartLogGrouper).to be true
  end

  it 'should group visits by page and count unique ones' do
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

  it 'implements class method "description"' do
    description = SmartLogParser::PageAccessCountGrouper.description
    expect(description).to be_an_instance_of String
    expect(description).not_to be_empty
  end

  it 'implements class method "description"' do
    follower_text = SmartLogParser::PageAccessCountGrouper.follower_text
    expect(follower_text).to be_an_instance_of String
    expect(follower_text).not_to be_empty
  end
end
