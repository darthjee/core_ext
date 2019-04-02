# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      class DeepHashConstructor
        class Setter
          def initialize(hash, base_key)
            @hash     = hash
            @base_key = base_key
            @key      = key
          end

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
