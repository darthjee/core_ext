# frozen_string_literal: true

describe Array do
  describe 'readme' do
    describe '#as_hash' do
      subject(:array) { [10, 20, 30, 40] }

      let(:keys) { %i[ten twenty thirty fourty] }

      it 'pairs keys and values' do
        expect(array.as_hash(keys))
          .to eq(ten: 10, twenty: 20, thirty: 30, fourty: 40)
      end
    end

    describe '#average' do
      subject(:array) { [1, 2, 3, 4] }

      it 'calculates the average' do
        expect(array.average).to eq(2.5)
      end
    end

    describe '#chain_map' do
      subject(:array) { %i[a long_name sym] }

      it 'maps calling the methods' do
        expect(array.chain_map(:to_s, :size, :to_s))
          .to eq(%w[1 9 3])
      end

      context 'when giving a block' do
        let(:mapped) do
          array.chain_map(:to_s, :size) { |v| "final: #{v}" }
        end

        it 'maps calling the methods' do
          expect(mapped)
            .to eq(['final: 1', 'final: 9', 'final: 3'])
        end
      end
    end

    describe 'mapk' do
      let(:array) do
        [
          { a: { b: 1 }, b: 2 },
          { a: { b: 3 }, b: 4 }
        ]
      end

      it 'maps fetching keys' do
        expect(array.mapk(:a, :b)).to eq([1, 3])
      end
    end

    describe '#procedural_join' do
      subject(:array) { [1, 2, -3, -4, 5] }

      let(:mapper) { proc { |value| value.to_f.to_s } }
      let(:string) do
        array.procedural_join(mapper) do |_previous, nexte|
          nexte.positive? ? ' +' : ' '
        end
      end

      it 'joins with grace' do
        expect(string).to eq('1.0 +2.0 -3.0 -4.0 +5.0')
      end
    end

    describe '#random' do
      let(:array) { [10, 20, 30] }

      it 'returns a random element' do
        expect(array).to include(array.random)
      end
    end
  end
end
