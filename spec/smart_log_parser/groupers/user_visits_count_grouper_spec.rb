require 'spec_helper'

RSpec.describe 'user visits count grouper' do
  it 'should extend smart_log_grouper' do
    expect(SmartLogParser::UserVisitsCountGrouper < SmartLogParser::SmartLogGrouper).to be true
  end

  it 'should group visits by IP address and count them' do
    file_path = 'spec/webserver_spec.log'
    reader = SmartLogParser::LineByLineReader.new(file_path)
    grouper = SmartLogParser::UserVisitsCountGrouper.new(reader)
    expected_result = {
      "123.123.123.123" => 7,
      "456.456.456.456" => 5,
      "789.789.789.789" => 1,
    }

    expect(grouper.group).to eql(expected_result)
  end

  it 'implements class method "description"' do
    description = SmartLogParser::UserVisitsCountGrouper.description
    expect(description).to be_an_instance_of String
    expect(description).not_to be_empty
  end

  it 'implements class method "description"' do
    follower_text = SmartLogParser::UserVisitsCountGrouper.follower_text
    expect(follower_text).to be_an_instance_of String
    expect(follower_text).not_to be_empty
  end
end
