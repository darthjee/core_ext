# frozen_string_literal: true

require 'spec_helper'

describe Object do
  describe 'readme' do
    describe '#is_any' do
      context 'when is one of the classes' do
        it do
          expect(1).to be_is_any(String, Symbol, Numeric)
        end
      end

      context 'when is none of the classes' do
        it do
          expect(1).not_to be_is_any(String, Symbol)
        end
      end
    end

    describe '#trueful?' do
      context 'when it is a regular object' do
        it { expect(Object.new.trueful?).to be_truthy }
      end

      context 'when it is an empty string' do
        it { expect("".trueful?).to be_truthy }
      end

      context 'when it is an empty hash' do
        it { expect({}.trueful?).to be_truthy }
      end

      context 'when it is an empty array' do
        it { expect([].trueful?).to be_truthy }
      end

      context 'when it is 0' do
        it { expect(0.trueful?).to be_truthy }
      end

      context 'when it is nil' do
        it { expect(nil.trueful?).to be_falsey }
      end
    end
  end
end
