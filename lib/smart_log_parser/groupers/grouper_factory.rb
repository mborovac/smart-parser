Dir[File.join(__dir__, '*.rb')].each { |file| require file }

module SmartLogParser
  class GrouperFactory
    GROUPER_MAPPER = {
      PAC: PageAccessCountGrouper,
      UPAC: UniquePageAccessCountGrouper
    }

    def initialize(reader)
      @reader = reader
    end

    def create_grouper(group)
    end
  end
end
