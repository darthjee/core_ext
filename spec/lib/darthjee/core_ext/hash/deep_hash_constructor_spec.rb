# frozen_string_literal: true

require 'spec_helper'

describe Darthjee::CoreExt::Hash::DeepHashConstructor do
  let(:constructor) { described_class.new('.') }
  let(:deep_hash)   { constructor.deep_hash(hash) }

  describe '#deep_hash' do
    it_behaves_like 'a method that returns a deep hash' do
      let(:constructor) { described_class.new(*args) }
      let(:result)      { constructor.deep_hash(hash) }
    end
  end
end
