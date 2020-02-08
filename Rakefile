require_relative 'lib/smart_log_parser/groupers/grouper_factory'
require_relative 'lib/smart_log_parser/orderers/orderer_factory'

desc 'Parser manual'
namespace :man do
  task :grouper_options do
    puts "Grouper options available in SmartLogParser and their behaviour:"
    puts SmartLogParser::GrouperFactory::GROUPER_MAPPER.transform_values{|v| v.description }
  end

  task :orderer_options do
    puts "Orderer options available in SmartLogParser and their behaviour:"
    puts SmartLogParser::OrdererFactory::ORDERER_MAPPER.transform_values{|v| v.direction_text }
  end
end
