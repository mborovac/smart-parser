Dir[File.join(__dir__, '*.rb')].each { |file| require file }

module SmartLogParser
  class GrouperFactory
    GROUPER_MAPPER = {
      PAC: PageAccessCountGrouper,
      UPAC: UniquePageAccessCountGrouper,
      UVC: SmartLogParser::UserVisitsCountGrouper,
      UUVC: SmartLogParser::UniqueUserVisitsCountGrouper
    }

    def initialize(reader)
      @reader = reader
    end

    def create_grouper(group)
      group = group.to_sym
      raise SmartLogParserException.new("Unknown grouping option #{group}. Run 'rake man:grouper_options' to get a list of all available grouping options.") unless GROUPER_MAPPER.keys.include?(group)

      GROUPER_MAPPER[group].new(@reader)
    end
  end
end
