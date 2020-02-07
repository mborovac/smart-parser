module SmartLogParser
  class LogParser
    def initialize(log_file)
      if log_file.nil? || log_file.empty?
        raise SmartLogParser::SmartLogParserException.new "No log file given!"
      end
      @log_file = log_file
    end
  end
end
