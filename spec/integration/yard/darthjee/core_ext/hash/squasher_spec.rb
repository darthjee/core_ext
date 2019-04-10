# frozen_string_literal: true

describe Darthjee::CoreExt::Hash::Squasher do
  subject(:squasher) { described_class }

  describe '.squash' do
    describe 'Simple Usage' do
      let(:hash) do
        {
          person: {
            name: 'John',
            age: 22
          }
        }
      end

      let(:expected) do
        {
          'person.name' => 'John',
          'person.age'  => 22
        }
      end

      it 'squashes the hash' do
        expect(squasher.squash(hash)).to eq(expected)
      end
    end
  end
end
