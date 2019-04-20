# frozen_string_literal: true

describe Darthjee::CoreExt::Object do
  describe 'yard' do
    describe '#is_any?' do
      subject(:object) { [1, 2, 3] }

      context 'when none match' do
        it do
          expect(object).not_to be_is_any(Hash, Class)
        end
      end

      context 'when at least one of them matches' do
        it do
          expect(object).to be_is_any(Hash, Array)
        end
      end

      context 'when a module matches' do
        it do
          expect(object).to be_is_any(Enumerable, Class)
        end
      end
    end
  end
end
