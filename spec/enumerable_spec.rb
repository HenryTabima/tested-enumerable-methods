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
end
