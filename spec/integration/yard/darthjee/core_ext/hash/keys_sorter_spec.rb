# frozen_string_literal: true

require 'spec_helper'

describe Darthjee::CoreExt::Hash::KeysSorter do
  subject(:sorter) { described_class.new(hash) }

  describe 'yard' do
    describe 'Simple Usage' do
      let(:hash) { { key: 10, a_key: { z: 5, a: 10 } } }

      it 'sorts the keys' do
        expect(sorter.sort)
          .to eq(a_key: { a: 10, z: 5 }, key: 10)
      end
    end
  end
end
