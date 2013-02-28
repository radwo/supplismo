require 'spec_helper.rb'

describe 'Stock' do
  before {
    @stock = Supplismo::Stock.new
  }

  describe '#class_name' do
    (0..2).each do |i|
      specify {
        @stock.status_id = i
        @stock.class_name.should be == Supplismo::Stock.new.send(:class_names)[i]
      }
    end
  end

  describe '#status' do
    (0..2).each do |i|
      specify {
        @stock.status_id = i
        @stock.status.should be == Supplismo::Stock.new.send(:status_names)[i]
      }
    end
  end

  describe '#status=' do
    (0..2).each do |i|
      specify {
        @stock.status = Supplismo::Stock.new.send(:status_names)[i]
        @stock.status_id.should be == i
      }
    end
  end
end
