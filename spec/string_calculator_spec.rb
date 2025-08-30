require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject(:calc) { described_class.new }

  describe '#add' do
    it 'returns 0 for empty string' do
      expect(calc.add("")).to eq(0)
    end

    it 'returns the number for a single number string' do
      expect(calc.add("1")).to eq(1)
    end

    it 'sums two comma separated numbers' do
      expect(calc.add("1,5")).to eq(6)
    end

		it 'handles newline as delimiter' do
			expect(calc.add("1\n2,3")).to eq(6)
		end

		it 'supports custom single-character delimiter declared like //;\n1;2' do
			expect(calc.add("//;\n1;2")).to eq(3)
		end
  end
end