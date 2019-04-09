# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      # @api private
      #
      # @author Darthjee
      #
      # Class responsible for sorting keys of a Hash
      class KeysSorter
        # @param hash [::hash] hash to be sorted
        # @param recursive [::TrueClass,::FalseClass]
        #   flag indicating to perform transformation
        #   recursively
        def initialize(hash, recursive: true)
          @hash = hash
          @recursive = recursive
        end

        # Creates a new Hash sorting it's keys
        #
        # @return [::Hash] new hash
        #
        # @example (see KeyChangeable#sort_keys)
        #
        # @example Simple Usage
        #   hash = { key: 10, a_key: { z: 5, a: 10 } }
        #   sorter = Darthjee::CoreExt::Hash::KeysSorter.new(hash)
        #
        #   sorter.sort  # returns {
        #                #   a_key: { a: 10, z: 5 },
        #                #   key: 10
        #                # }
        def sort
          {}.tap do |new_hash|
            sorted_keys.each do |key|
              new_hash[key] = change_value(hash[key])
            end
          end
        end

        private

        # @api private
        # @private
        #
        # Returns all keys sorted
        #
        # @return [::Array<::Object>]
        def sorted_keys
          hash.keys.sort
        end

        # @api private
        # @private
        #
        # Applies recursion when needed
        #
        # @return [::Object]
        def change_value(value)
          return value unless recursive
          return value unless value.is_a?(Hash)
          self.class.new(value).sort
        end

        attr_reader :hash, :recursive
      end
    end
  end
end
