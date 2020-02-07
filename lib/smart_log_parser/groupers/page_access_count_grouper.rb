require_relative 'smart_log_grouper'

module SmartLogParser
  class PageAccessCountGrouper < SmartLogParser::SmartLogGrouper
    def group
      page_access_count = Hash.new(0)

      @reader.read_lines do |page, _address|
        page_access_count[page] += 1
      end

      page_access_count
    end
  end
end
