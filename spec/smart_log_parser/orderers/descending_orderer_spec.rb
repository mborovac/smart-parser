require 'spec_helper'

RSpec.describe 'descending orderer' do
  it 'should extend smart_log_orderer' do
    expect(SmartLogParser::DescendingOrderer < SmartLogParser::SmartLogOrderer).to be true
  end

  it 'orders input hash by value in descending order' do
    orderer_data = {
      a: 2,
      b: 3,
      c: 1,
      d: 4
    }
    expected_output = [
      [:d, 4],
      [:b, 3],
      [:a, 2],
      [:c, 1]
    ]
    orderer = SmartLogParser::DescendingOrderer.new(orderer_data)

    expect(orderer.order).to eql(expected_output)
  end
end
