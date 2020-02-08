require 'spec_helper'

RSpec.describe 'orderer factory' do
  let(:orderer_factory) { SmartLogParser::OrdererFactory.new }
  let(:data) { {a: 1, b: 2, c: 3} }

  describe 'creating an orderer' do
    it 'throws an error if given ordering option is invalid' do
      order = 'error'
      expect{ orderer_factory.create_orderer(data, order) }.to raise_exception(SmartLogParser::SmartLogParserException, "Unknown ordering option #{order}.")
    end
  end

  describe 'creates a new instance of appropriate orderer class' do
    it 'when order param is a string' do
      order = 'up'
      orderer = orderer_factory.create_orderer(data, order)
      expect(orderer.class).to be SmartLogParser::AscendingOrderer
    end

    it 'when order param is a symbol' do
      order = :up
      orderer = orderer_factory.create_orderer(data, order)
      expect(orderer.class).to be SmartLogParser::AscendingOrderer
    end

    it 'when descending orderer is wanted' do
      order = :down
      orderer = orderer_factory.create_orderer(data, order)
      expect(orderer.class).to be SmartLogParser::DescendingOrderer
    end
  end
end
