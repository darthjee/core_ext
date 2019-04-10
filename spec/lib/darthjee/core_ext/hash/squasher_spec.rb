# frozen_string_literal: true

require 'spec_helper'

describe Darthjee::CoreExt::Hash::Squasher do
  it_behaves_like 'a class that has a method to squash a hash' do
    let(:squashed) { described_class.new.squash(hash) }
  end
end
