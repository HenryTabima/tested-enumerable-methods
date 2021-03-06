require './lib/enumerable'

describe Enumerable do # rubocop:disable Metrics/BlockLength
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

  describe '#my_inject' do
    context 'works like #inject' do
      it 'with inital value' do
        product = numbers.inject(2) { |mult, n| mult * n }
        my_product = numbers.my_inject(2) { |mult, n| mult * n }
        expect(my_product).to eq(product)
      end

      it 'without initial value' do
        product = numbers.inject { |mult, n| mult * n }
        my_product = numbers.my_inject { |mult, n| mult * n }
        expect(my_product).to eq(product)
      end

      it 'using #reduce alias' do
        sum_res = numbers.reduce { |sum, n| sum + n }
        my_sum_res = numbers.my_reduce { |sum, n| sum + n }
        expect(my_sum_res).to eq(sum_res)
      end
    end
  end

  describe '#my_select' do
    it 'works like #select' do
      select_res = numbers.select { |n| n < 4 }
      my_select_res = numbers.my_select { |n| n < 4 }
      expect(my_select_res).to eq(select_res)
    end
  end

  describe '#my_all?' do
    context 'works like #all?' do
      it 'when true' do
        all_res = numbers.all? { |n| n < 6 }
        my_all_res = numbers.my_all? { |n| n < 6 }
        expect(my_all_res).to eq(all_res)
      end

      it 'when false' do
        all_res = numbers.all? { |n| n < 4 }
        my_all_res = numbers.my_all? { |n| n < 4 }
        expect(my_all_res).to eq(all_res)
      end
    end
  end

  describe '#my_any?' do
    context 'works like #any?' do
      it 'when true' do
        any_res = numbers.any? { |n| n == 4 }
        my_any_res = numbers.my_any? { |n| n == 4 }
        expect(my_any_res).to eq(any_res)
      end

      it 'when false' do
        any_res = numbers.any? { |n| n == 6 }
        my_any_res = numbers.my_any? { |n| n == 6 }
        expect(my_any_res).to eq(any_res)
      end
    end
  end
end
