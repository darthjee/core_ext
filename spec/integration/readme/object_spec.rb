# frozen_string_literal: true

require 'spec_helper'

describe Object do
  describe 'readme' do
    # rubocop: disable RSpec/PredicateMatcher
    describe '#is_any' do
      context 'when is one of the classes' do
        it do
          expect(1.is_any?(String, Symbol, Numeric)).to be_truthy
        end
      end

      context 'when is none of the classes' do
        it do
          expect(1.is_any?(String, Symbol)).to be_falsey
        end
      end
    end

    describe '#trueful?' do
      context 'when it is a regular object' do
        it { expect(described_class.new.trueful?).to be_truthy }
      end

      context 'when it is an empty string' do
        it { expect(''.trueful?).to be_truthy }
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
    # rubocop: enable RSpec/PredicateMatcher
  end
end
