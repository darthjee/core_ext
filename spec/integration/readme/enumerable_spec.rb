# frozen_string_literal: true

describe Enumerable do
  describe 'readme' do
    describe '#clean' do
      let(:array) { [1, [], nil, {}, '', hash] }
      let(:hash)  { { b: [], c: nil, d: {}, e: '' } }

      it 'cleans array' do
        expect(array.clean).to eq([1])
      end
    end

    describe '#clean!' do
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

    describe '#map_and_find' do
      let(:ids)          { [10, 21, 30, 31, 51, 55] }
      let(:client)       { Client.new(existing_ids) }
      let(:existing_ids) { [1, 11, 21, 31, 41, 51] }
      let(:request)      { client.method(:request) }

      it 'returns the value found' do
        expect(ids.map_and_find(&request)).to eq(id: 21)
      end

      it 'does not perform all requests all' do
        expect { ids.map_and_find(&request) }
          .to change(client, :requested)
          .from([]).to([10, 21])
      end
    end
  end
end
