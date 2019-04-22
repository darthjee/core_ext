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
  end
end
