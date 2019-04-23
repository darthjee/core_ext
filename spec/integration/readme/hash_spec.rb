# frozen_string_literal: true

describe Hash do
  describe 'readme' do
    describe '#chain_fetch' do
      subject(:hash) { { a: { b: { c: { d: 10 } } } } }

      it 'fetches value from hashes' do
        expect(hash.chain_fetch(:a, :b, :c, :d)).to eq(10)
      end

      context 'when passing a block' do
        let(:value) do
          hash.chain_fetch(:a, :x, :y, :z) do |key, missed_keys|
            "returned: #{key}\nmissed: [#{missed_keys.join(',')}]"
          end
        end

        it 'return processing of the missed keys' do
          expect(value).to eq("returned: x\nmissed: [y,z]")
        end
      end
    end

    describe '#camelize_keys' do
      subject(:hash) { { ca_b: 1, k: [{ a_b: 1 }] } }

      it 'camelize all keys' do
        expect(hash.camelize_keys)
          .to eq(CaB: 1, K: [{ AB: 1 }])
      end
    end
  end
end
