# frozen_string_literal: true

describe Darthjee::CoreExt::Symbol do
  describe 'yard' do
    describe '#camelize' do
      it 'camelizes symbol' do
        expect(:the_symbol.camelize).to eq(:TheSymbol)
      end
    end

    describe '#underscore' do
      it 'underscores symbol' do
        expect(:theSymbol.underscore).to eq(:the_symbol)
      end
    end
  end
end
