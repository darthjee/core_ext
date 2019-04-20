# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      # @author darthjee
      #
      # Collection of methods for transposing keys
      # and values of hash
      module Transposeable
        # Transpose matrix swapping keys by values
        #
        # @return [::Hash]
        #
        # @example
        #   hash = {
        #     key1: :value1,
        #     key2: :value2,
        #   }
        #
        #   hash.transpose # returns {
        #                  #   value1: :key1,
        #                  #   value2: :key2
        #                  # }
        def transpose!
          aux = dup
          keys.each(&method(:delete))
          aux.each do |key, value|
            self[value] = key
          end
          self
        end

        # Transpose matrix swapping keys by values
        #
        # @return [::Hash]
        #
        # @example
        #   hash = {
        #     key1: :value1,
        #     key2: :value2,
        #   }
        #
        #   hash.transpose # changes hash to {
        #                  #   value1: :key1,
        #                  #   value2: :key2
        #                  # }
        def transpose
          {}.tap do |new_hash|
            each do |key, value|
              new_hash[value] = key
            end
          end
        end
      end
    end
  end
end
