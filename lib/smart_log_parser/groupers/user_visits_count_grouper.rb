require_relative 'smart_log_grouper'

module SmartLogParser
  class UserVisitsCountGrouper < SmartLogGrouper
    def group
      user_page_visit_count = Hash.new(0)

      @reader.read_lines do |_page, user|
        user_page_visit_count[user] += 1
      end

      user_page_visit_count
    end

    def self.description
      'List of page visits per user'
    end

    def self.follower_text
      'page visits'
    end
  end
end
