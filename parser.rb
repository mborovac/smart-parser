#!/usr/bin/ruby

require_relative 'lib/smart_log_parser/exceptions/smart_log_parser_exception'
require_relative 'lib/smart_log_parser/log_parser'

log_file = ARGV[0]
group_and_order_array = ARGV[1..-1]

begin
  SmartLogParser::LogParser.new(log_file, group_and_order_array).parse
rescue SmartLogParser::SmartLogParserException => e
  puts "#{e.message} Aborting..."
end
