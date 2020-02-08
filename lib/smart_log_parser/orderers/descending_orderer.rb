module SmartLogParser
  class DescendingOrderer < SmartLogOrderer
    def order
      @data.sort_by{|k, v| -v}
    end

    def self.direction_text
    end
  end
end
