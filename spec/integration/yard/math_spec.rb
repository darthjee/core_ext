# frozen_string_literal: true

describe Math do
  describe 'yard' do
    describe '.average' do
      describe 'Average of array' do
        let(:values) { [1, 2, 3, 4] }

        it 'calculates the average' do
          expect(described_class.average(values)).to eq(2.5)
        end
      end

      describe 'Average of hash' do
        let(:values) do
          {
            1 => 3,
            7 => 1
          }
        end

        it 'calculates the average' do
          expect(described_class.average(values)).to eq(2.5)
        end
      end
    end
  end
end
