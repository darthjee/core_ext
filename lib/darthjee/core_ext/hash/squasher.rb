# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      # @api private
      #
      # @author Darthjee
      #
      # class responsible for squashing a hash
      #
      # @see Transformable#squash
      # @see Transformable#to_deep_hash
      #
      # @example (see Transformable#squash)
      # @example (see #squash)
      class Squasher
        attr_reader :joiner

        # @param joiner [::String] string used to join keys
        def initialize(joiner = '.')
          @joiner = joiner
        end

        # Squash a hash creating a new hash
        #
        # Squash the hash so that it becomes a single level
        # hash merging the keys of outter and inner hashes
        #
        # @param origin [::Hash] hash to be squashed
        #
        # @return [::Hash]
        #
        # @example Simple usage
        #   hash = {
        #     person: {
        #       name: 'John',
        #       age: 22
        #     }
        #   }
        #
        #   squasher = Darthjee::CoreExt::Hash::Squasher.new
        #
        #   squasher.squash(hash) # returns {
        #                         #   'person.name' => 'John',
        #                         #   'person.age'  => 22
        #                         # }
        def squash(hash)
          hash.keys.each do |key|
            value = hash.delete(key)
            hash.merge!(sub_hash(key, value))
          end
          hash
        end

        private

        def sub_hash(key, value)
          return { key => value } unless value.is_a?(Hash)

          prepend_to_key(key, squash(value))
        end

        # @private
        #
        # Appends prefix to all keys of a hash
        #
        # @param prefix [::String] prefix to be prepended
        # @param hash [::Hash] original hash to me changed
        #   (already squashed)
        #
        # @return [::Hash] new hash already squashed
        def prepend_to_key(prefix, hash)
          hash.inject({}) do |hash, (key, value)|
            new_key = [prefix, key].join(joiner)
            hash.merge!(new_key => value)
          end
        end
      end
    end
  end
end
