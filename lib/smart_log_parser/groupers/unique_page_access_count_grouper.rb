require_relative 'smart_log_grouper'

module SmartLogParser
  class UniquePageAccessCountGrouper < SmartLogParser::SmartLogGrouper
    def group
      user_page_access_count = Hash.new(0)
      unique_page_access_count = Hash.new(0)

      @reader.read_lines do |page, user|
        user_page_key = "#{user}_#{page}"

        unique_page_access_count[page] += 1 if user_page_access_count[user_page_key] == 0
        user_page_access_count[user_page_key] += 1
      end

      unique_page_access_count
    end
  end
end
