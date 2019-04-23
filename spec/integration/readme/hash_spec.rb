# frozen_string_literal: true

describe Hash do
  describe 'readme' do
    describe '#chain_fetch' do
      subject(:hash) { { a: { b: { c: { d: 10 } } } } }

      it 'fetches value from hashes' do
        expect(hash.chain_fetch(:a, :b, :c, :d)).to eq(10)
      end
    end
  end
end
