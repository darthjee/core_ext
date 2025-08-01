# frozen_string_literal: true

require 'spec_helper'

describe Symbol do
  describe '#camelize' do
    it { expect(:sym.camelize).to be_a(described_class) }

    context 'when called with upper option' do
      it 'camelize the symbol' do
        expect(:underscore_sym.camelize(:upper)).to eq(:UnderscoreSym)
      end
    end

    context 'when called with lower option' do
      it 'camelize the symbol without captalization' do
        expect(:underscore_sym.camelize(:lower)).to eq(:underscoreSym)
      end
    end

    context 'when called without option' do
      it 'camelize the symbol' do
        expect(:underscore_sym.camelize).to eq(:UnderscoreSym)
      end
    end
  end

  describe '#underscore' do
    it { expect(:symBol.underscore).to be_a(described_class) }

    context 'when called with upper option' do
      it 'underscore the symbol' do
        expect(:symBol.underscore).to eq(:sym_bol)
      end
    end
  end
end
