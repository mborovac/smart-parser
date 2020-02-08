module SmartLogParser
  class LogParserPrinter
    def self.print_visits(data_array, description, follower_text, order)
      print_array = []
      print_array << "#{description} ordered in #{order}"
      data_array.each{|page, count| print_array << "#{page} #{count} #{follower_text}" }
      puts print_array.join("\n")
    end
  end
end
