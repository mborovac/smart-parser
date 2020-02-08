require_relative 'smart_log_grouper'

module SmartLogParser
  class UniqueUserVisitsCountGrouper < SmartLogGrouper
    def group
      user_page_access_count = Hash.new(0)
      unique_user_page_visit_count = Hash.new(0)

      @reader.read_lines do |page, user|
        user_page_key = "#{user}_#{page}"

        unique_user_page_visit_count[user] += 1 if user_page_access_count[user_page_key] == 0
        user_page_access_count[user_page_key] += 1
      end

      unique_user_page_visit_count
    end

    def self.description
      'List of unique page visits per user'
    end

    def self.follower_text
      'unique page visits'
    end
  end
end
