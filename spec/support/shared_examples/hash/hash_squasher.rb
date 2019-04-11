# frozen_string_literal: true

require 'spec_helper'

shared_examples 'a method to squash a hash' do |joiner = '.'|
  let(:hash) { { a: { b: 1, c: { d: 2 } } } }
  let(:key1) { %w[a b].join(joiner) }
  let(:key2) { %w[a c d].join(joiner) }

  it 'flattens the hash' do
    expect(squashed).to eq(key1 => 1, key2 => 2)
  end

  it { expect { hash.squash }.not_to(change { hash }) }

  context 'with array value' do
    let(:hash) { { a: { b: [1, { x: 3, y: { z: 4 } }] } } }
    let(:key)  { %w[a b].join(joiner) }

    it 'flattens the hash' do
      expect(squashed)
        .to eq(key => [1, { x: 3, y: { z: 4 } }])
    end
  end
end
