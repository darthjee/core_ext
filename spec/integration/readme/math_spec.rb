# frozen_string_literal: true

require 'spec_helper'

describe Math do
  describe 'readme' do
    describe '.average' do
      let(:values) { [ 0, 1, 2, 3, 4, 5 ] }

      it 'calculates average' do
        expect(described_class.average(values)).to eq(2.5)
      end
    end
  end
end
