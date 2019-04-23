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

      context 'when passing recursive false' do
        it 'camelize all keys without recursion' do
          expect(hash.camelize_keys(recursive: false))
            .to eq(CaB: 1, K: [{ a_b: 1 }])
        end
      end

      context 'when not upcasing first letter' do
        it 'camelize all keys' do
          expect(hash.camelize_keys(uppercase_first_letter: false))
            .to eq(caB: 1, k: [{ aB: 1 }])
        end
      end
    end

    describe '#lower_camelize_keys' do
      subject(:hash) { { ca_b: 1, k: [{ a_b: 1 }] } }

      it 'camelize with lower case' do
        expect(hash.lower_camelize_keys)
          .to eq(caB: 1, k: [{ aB: 1 }])
      end
    end

    describe '#undescore_keys' do
      subject(:hash) { { Ca_B: 1, 'kB' => [{ KeysHash: 1 }] } }

      it 'camelize with lower case' do
        expect(hash.underscore_keys)
          .to eq(ca_b: 1, 'k_b' => [{ keys_hash: 1 }])
      end
    end
  end
end
