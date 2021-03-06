# frozen_string_literal: true

require 'spec_helper'

describe Darthjee::CoreExt::Hash::KeyChanger do
  subject(:key_changer) { described_class.new(hash) }

  describe '#remap_keys!' do
    it_behaves_like 'a method that remaps the keys', :remap do
      it 'changes the original hash' do
        expect { result }.to(change { hash })
      end
    end
  end

  describe '#underscore_keys' do
    let(:hash) { { keyUnderscore: 1 } }

    it 'underscore all the keys' do
      expect(key_changer.underscore_keys).to eq(key_underscore: 1)
    end

    context 'when hash is a many level hash' do
      let(:hash) { { keyUnderscore: { anotherKey: 1 } } }

      it 'underscore all the keys' do
        result = key_changer.underscore_keys
        expect(result).to eq(key_underscore: { another_key: 1 })
      end
    end

    context 'when hash has an array' do
      let(:hash) { { keyUnderscore: [{ anotherKey: 1 }] } }

      it 'underscore all the keys' do
        result = { key_underscore: [{ another_key: 1 }] }
        expect(key_changer.underscore_keys).to eq(result)
      end
    end

    context 'when call changes the hash' do
      it 'underscore all the keys' do
        expect do
          key_changer.underscore_keys
        end.to(change { hash })
      end
    end

    context 'when giving non recursive options' do
      context 'when hash is a many level hash' do
        let(:hash) { { keyUnderscore: { anotherKey: 1 } } }

        it 'underscore all the keys' do
          result = key_changer.underscore_keys(recursive: false)
          expect(result).to eq(key_underscore: { anotherKey: 1 })
        end
      end

      context 'when hash has an array' do
        let(:hash) { { keyUnderscore: [{ anotherKey: 1 }] } }

        it 'underscore all the keys' do
          result = key_changer.underscore_keys(recursive: false)
          expect(result).to eq(key_underscore: [{ anotherKey: 1 }])
        end
      end
    end
  end
end
