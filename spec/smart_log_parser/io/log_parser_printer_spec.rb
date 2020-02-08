require 'spec_helper'

RSpec.describe 'log parser printer' do
  it 'prints out a given data array with header and description sugar' do
    data_array = [
      [:b, 1],
      [:a, 2],
    ]
    description = 'LogParserPrinter test description'
    follower_text = 'test count'
    ordering_description = 'ascending order'

    expected_output = [
      "#{description} ordered in #{ordering_description}",
      "#{data_array[0][0]} #{data_array[0][1]} #{follower_text}",
      "#{data_array[1][0]} #{data_array[1][1]} #{follower_text}"
    ].join("\n")

    expect{ SmartLogParser::LogParserPrinter.print_visits(data_array, description, follower_text, ordering_description) }.to output(expected_output + "\n").to_stdout
  end
end
