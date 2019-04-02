# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      class DeepHashConstructor
        # @api private
        #
        # Class responsible for setting value localized inside hash
        #
        # @example Simple usage
        #   hash   = {}
        #   base   = 'person'
        #   setter = Darthjee::CoreExt::Hash::DeepHashConstructor::Setter.new(
        #     hash, base
        #   )
        #
        #   setter.set('age', 21)
        #
        #   hash # changed to {
        #        #   'person' => {
        #        #     'age' => 21,
        #        #   }
        #        # }
        class Setter
          # @param hash [Hash] hash to be changed
          # @param base_key [::String] base key of hash where
          #   subhash will be created
          def initialize(hash, base_key)
            @hash     = hash
            @base_key = base_key
            @key      = key
          end

          # Sets a value in the correct key inside the hash
          #
          # @param key [::String,::NilClass] key where value will live
          # @param value [::Object] value to be set
          #
          # @example (see DeepHashConstructor)
          #
          # @example With Array index
          #   hash   = {}
          #   base   = 'person[0]'
          #   setter = Darthjee::CoreExt::Hash::DeepHashConstructor::Setter.new(
          #     hash, base
          #   )
          #
          #   setter.set('age', 21)
          #
          #   hash # changed to {
          #        #   'person' => [{
          #        #     'age' => 21,
          #        #   }]
          #        # }
          def set(key, value)
            return hash[base_key]    = value if key.nil? && index.nil?
            return array[index]      = value if key.nil?

            base[key] = value
          end

          private

          attr_reader :hash, :base_key, :key

          def index
            @index ||= array_index
          end

          def array_index
            match = base_key.match(/\[([^)]+)\]/)
            return unless match

            match[1].to_i
          end

          def array
            @array ||= build_array
          end

          def build_array
            key_without_index = base_key.tr("[#{index}]", '')
            hash[key_without_index] ||= []
          end

          def base
            return array[index] ||= {} if index

            hash[base_key] ||= {}
          end
        end
      end
    end
  end
end
