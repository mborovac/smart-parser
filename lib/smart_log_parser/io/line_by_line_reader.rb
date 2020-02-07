module SmartLogParser
  class LineByLineReader
    def initialize(log_file)
      @log_file = log_file
    end

    def read_lines
      unless File.exists?(@log_file)
        raise SmartLogParserException.new "File #{@log_file} does not exist."
      end

      File.foreach(@log_file) do |line|
        yield line.split(' ')
      end
    end
  end
end
