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
      grouped_data = SmartLogParser::PageAccessCountGrouper.new(reader).group
      ordered_data = SmartLogParser::DescendingOrderer.new(grouped_data).order
      SmartLogParser::LogParserPrinter.print_visits(ordered_data, description, follower_text, ordering_description)
    end
  end
end
