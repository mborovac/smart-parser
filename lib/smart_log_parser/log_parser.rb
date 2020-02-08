module SmartLogParser
  class LogParser
    def initialize(log_file)
      if log_file.nil? || log_file.empty?
        raise SmartLogParser::SmartLogParserException.new "No log file given!"
      end
      @log_file = log_file
    end

    def parse(description, follower_text, ordering_description)
      reader = SmartLogParser::LineByLineReader.new(@log_file)
      grouper_factory = SmartLogParser::GrouperFactory.new(reader)
      orderer_factory = SmartLogParser::OrdererFactory.new
      grouped_data = grouper_factory.create_grouper(:PAC).group
      ordered_data = orderer_factory.create_orderer(grouped_data, :down).order
      SmartLogParser::LogParserPrinter.print_visits(ordered_data, description, follower_text, ordering_description)
    end
  end
end
