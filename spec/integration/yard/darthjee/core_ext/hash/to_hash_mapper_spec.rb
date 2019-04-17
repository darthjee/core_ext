# frozen_string_literal: true

describe Darthjee::CoreExt::Hash::ToHashMapper do
  subject(:mapper) { described_class.new(hash) }

  describe 'yard' do
    describe '#map' do
      let(:hash) do
        {
          key: 'the string',
          other_key: 'yet another string'
        }
      end

      let(:result) do
        mapper.map do |key, value|
          "#{key}#{value}".size
        end
      end

      it 'maps keeping the keys' do
        expect(result).to eq(key: 13, other_key: 27)
      end
    end
  end
end
