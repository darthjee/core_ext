# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      # @api private
      #
      # @author darthjee
      #
      # Class responsible for mapping to a hash
      #
      # The original keys are kept and the value
      # changed as it would in +#map+
      #
      # @see Transformable#map_to_hash
      #
      # @example (see #map)
      class ToHashMapper
        def initialize(hash)
          @hash = hash
        end

        # Maps the hash into a new hash keeping the keys
        #
        # @example Simple Usage
        #   hash = {
        #     key: 'the string',
        #     other_key: 'yet another string'
        #   }
        #
        #   mapper = Darthjee::CoreExt::Hash::ToHashMapper.new(hash)
        #
        #   mapper.map do |key, value|
        #     "#{key}#{value}".size
        #   end
        #
        #   # returns { key: 13, other_key: 27 }
        def map
          {}.tap do |new_hash|
            hash.each do |k, v|
              new_hash[k] = yield(k, v)
            end
          end
        end

        private

        attr_reader :hash
      end
    end
  end
end
