# frozen_string_literal: true

require 'spec_helper'

describe Math do
  describe 'readme' do
    describe '.average' do
      let(:values) { [0, 1, 2, 3, 4, 5] }

      it 'calculates average' do
        expect(described_class.average(values)).to eq(2.5)
      end

      context 'when giving a map' do
        let(:values) do
          {
            0 => 1,
            1 => 2,
            2 => 3,
            3 => 4,
            4 => 5
          }
        end

        it 'calculates average' do
          expect(described_class.average(values)).to eq(2.6666666666666666)
        end
      end
    end
  end
end
