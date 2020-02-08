require_relative 'io/line_by_line_reader'
require_relative 'io/log_parser_printer'
require_relative 'groupers/grouper_factory'
require_relative 'orderers/orderer_factory'

module SmartLogParser
  class LogParser
    attr_reader :log_file, :group_and_order_array

    DEFAULT_GROUP_AND_ORDER = ['PAC-down', 'UPAC-down']
    GROUP_AND_ORDER_SPLIT_CHAR = '-'

    def initialize(log_file, group_and_order_array)
      if log_file.nil? || log_file.empty?
        raise SmartLogParser::SmartLogParserException.new "No log file given!"
      end
      @log_file = log_file

      group_and_order_array = DEFAULT_GROUP_AND_ORDER if group_and_order_array.empty?
      @group_and_order_array = group_and_order_array.map{|gao| gao.split(GROUP_AND_ORDER_SPLIT_CHAR)}
    end

    def parse
      reader = SmartLogParser::LineByLineReader.new(@log_file)
      grouper_factory = SmartLogParser::GrouperFactory.new(reader)
      orderer_factory = SmartLogParser::OrdererFactory.new

      @group_and_order_array.each do |group, order|
        grouper = grouper_factory.create_grouper(group)
        grouped_data = grouper.group
        orderer = orderer_factory.create_orderer(grouped_data, order)
        ordered_data = orderer.order

        SmartLogParser::LogParserPrinter.print_visits(ordered_data, grouper.class.description, grouper.class.follower_text, orderer.class.direction_text)
      end
    end
  end
end
