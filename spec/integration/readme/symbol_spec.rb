# frozen_string_literal: true

describe Symbol do
  describe 'readme' do
    describe '#camelize' do
      it 'camelizes symbol' do
        expect(:underscore_sym.camelize(:upper))
          .to eq(:UnderscoreSym)
      end

      it 'camelizes symbol lowercasing first letter' do
        expect(:underscore_sym.camelize(:lower))
          .to eq(:underscoreSym)
      end

      it 'camelizes uppercasing first letter' do
        expect(:underscore_sym.camelize)
          .to eq(:UnderscoreSym)
      end
    end

    describe '#underscore' do
      it 'underscore symbols' do
        expect(:symBol.underscore)
          .to eq(:sym_bol)
      end
    end
  end
end
