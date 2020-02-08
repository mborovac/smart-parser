require 'spec_helper'

RSpec.describe 'grouper factory' do
  let(:reader) { SmartLogParser::LineByLineReader.new('spec/webserver_spec.log') }
  let(:grouper_factory) { SmartLogParser::GrouperFactory.new(reader) }

  describe 'creating a grouper' do
    it 'throws an error if given grouping option is invalid' do
      group = 'error'
      expect{ grouper_factory.create_grouper(group) }.to raise_exception(SmartLogParser::SmartLogParserException, "Unknown grouping option #{group}. Run 'rake man:grouper_options' to get a list of all available grouping options.")
    end
  end

  describe 'creates a new instance of appropriate grouper class' do
    it 'when group param is a string' do
      group = 'PAC'
      grouper = grouper_factory.create_grouper(group)
      expect(grouper.class).to be SmartLogParser::PageAccessCountGrouper
    end

    it 'when group param is a symbol' do
      group = :PAC
      grouper = grouper_factory.create_grouper(group)
      expect(grouper.class).to be SmartLogParser::PageAccessCountGrouper
    end

    it 'when unique page access count grouper is wanted' do
      group = :UPAC
      grouper = grouper_factory.create_grouper(group)
      expect(grouper.class).to be SmartLogParser::UniquePageAccessCountGrouper
    end
  end
end
