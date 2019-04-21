# frozen_string_literal: true

describe Enumerable do
  describe 'readme' do
    describe 'clean' do
      let(:array) { [1, [], nil, {}, '', hash] }
      let(:hash)  { { b: [], c: nil, d: {}, e: '' } }

      it 'cleans array' do
        expect(array.clean).to eq([1])
      end
    end

    describe 'clean!' do
      let(:hash) do
        {
          a: 1,
          b: [],
          c: nil,
          d: {},
          e: '',
          f: {
            b: [],
            c: nil,
            d: {},
            e: ''
          }
        }
      end

      it 'cleans array' do
        expect { hash.clean! }.to change { hash }
          .to(a: 1)
      end
    end
  end
end
