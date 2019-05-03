# frozen_string_literal: true

describe Date do
  describe 'readme' do
    subject(:date) { described_class.new(2106, 10, 11) }

    let(:future) { date + 1.year }
    let(:past)   { date - 1.year }

    it 'returns days between' do
      expect(date.days_between(future)).to eq(365)
    end

    it 'returns positive' do
      expect(date.days_between(past)).to eq(365)
    end
  end
end
