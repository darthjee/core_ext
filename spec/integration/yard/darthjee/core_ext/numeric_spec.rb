# frozen_string_literal: true

describe Darthjee::CoreExt::Numeric do
  describe 'yard' do
    describe '#percent_of' do
      it 'calculates the percentage over total' do
        expect(10.percent_of(30)).to eq(33.33333333333333)
      end
    end
  end
end
