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
        grouped_data = grouper_factory.create_grouper(group).group
        ordered_data = orderer_factory.create_orderer(grouped_data, order).order

        SmartLogParser::LogParserPrinter.print_visits(ordered_data, description, follower_text, ordering_description)
      end
    end
  end
end
