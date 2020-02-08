require 'spec_helper'

RSpec.describe 'ascending orderer' do
  it 'should extend smart_log_grouper' do
    expect(SmartLogParser::AscendingOrderer < SmartLogParser::SmartLogOrderer).to be true
  end

  it 'orders input hash by value in ascending order' do
    orderer_data = {
      a: 2,
      b: 3,
      c: 1,
      d: 4
    }
    expected_output = [
      [:c, 1],
      [:a, 2],
      [:b, 3],
      [:d, 4]
    ]
    orderer = SmartLogParser::AscendingOrderer.new(orderer_data)

    expect(orderer.order).to eql(expected_output)
  end

  it 'implements class method "direction_text"' do
    follower_text = SmartLogParser::AscendingOrderer.direction_text
    expect(follower_text).to be_an_instance_of String
    expect(follower_text).not_to be_empty
  end
end
