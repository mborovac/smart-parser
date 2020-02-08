require 'spec_helper'

RSpec.describe 'smart log orderer' do
  describe 'initialize' do
    it 'should raise an exception if given reader is nil' do
      expect{ SmartLogParser::SmartLogOrderer.new(nil) }.to raise_exception(SmartLogParser::SmartLogParserException, 'Data must exist!')
    end

    it 'should raise an exception if given reader is empty' do
      expect{ SmartLogParser::SmartLogOrderer.new({}) }.to raise_exception(SmartLogParser::SmartLogParserException, 'Data must exist!')
    end
  end

  describe 'as an interface-like class' do
    it 'has no implementation for "order" instance method' do
      orderer_data = {
        'a': 1,
        'b': 2
      }
      orderer_interface = SmartLogParser::SmartLogOrderer.new(orderer_data)

      expect{ orderer_interface.order }.to raise_exception(SmartLogParser::SmartLogParserException, 'SmartLogParser::SmartLogOrderer method order not implemented')
    end

    it 'has no implementation for "direction_text" class method' do
      expect{ SmartLogParser::SmartLogOrderer.direction_text }.to raise_exception(SmartLogParser::SmartLogParserException, 'SmartLogParser::SmartLogOrderer method direction_text not implemented')
    end
  end
end
