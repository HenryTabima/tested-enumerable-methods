require './lib/enumerable'

describe Enumerable do
  let(:numbers) { (1..5).to_a }
  describe '#my_each' do
    it 'works like #each' do
      each_result = []
      numbers.each { |n| each_result << n * 2 }
      my_each_result = []
      numbers.my_each { |n| my_each_result << n * 2 }
      expect(my_each_result).to eq(each_result)
    end
  end

  describe '#my_each_with_index' do
    it 'works like #each_with_index' do
      ewi_result = []
      numbers.each_with_index { |n, i| ewi_result << n * i }
      my_ewi_result = []
      numbers.my_each_with_index { |n, i| my_ewi_result << n * i }
      expect(my_ewi_result).to eq(ewi_result)
    end
  end
end
