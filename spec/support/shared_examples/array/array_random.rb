# frozen_string_literal: true

shared_examples 'a method that returns a random element' do |method|
  let(:array) { [7, 5, 3] }

  3.times do |index|
    context "when random returns #{index}" do
      let!(:expected) { array[index] }

      before do
        allow(Random).to receive(:rand).and_return(index)
      end

      it 'returns the randomized index of the array' do
        expect(array.public_send(method)).to eq(expected)
      end
    end
  end
end
