module SmartLogParser
  class LogParser
    def initialize(log_file)
      if log_file.nil? || log_file.empty?
        raise SmartLogParser::SmartLogParserException.new "No log file given!"
      end
      @log_file = log_file
    end

    def parse(description, follower_text, ordering_description)
    end
  end
end
