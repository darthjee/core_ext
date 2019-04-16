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
        #   squasher.squash(hash) # changes hash to {
        #                         #   'person.name' => 'John',
        #                         #   'person.age'  => 22
        #                         # }
        #
        # @example Custom joiner
        #   hash = {
        #     person: {
        #       name: 'John',
        #       age: 22
        #     }
        #   }
        #
        #   squasher = Darthjee::CoreExt::Hash::Squasher.new('> ')
        #
        #   squasher.squash(hash) # changes hash to {
        #                         #   'person> name' => 'John',
        #                         #   'person> age'  => 22
        #                         # }
        def squash(hash)
          hash.keys.each do |key|
            next unless hash[key].is_any?(Hash, Array)

            value = hash.delete(key)
            sub_hash = sub_hash_for(key, value)

            hash.merge!(sub_hash)
          end
          hash
        end

        private

        def squash_array(key, array)
          array.map.with_index.inject({}) do |hash, (element, index)|
            new_key = "#{key}[#{index}]"
            sub_hash = sub_hash_for(new_key, element)

            hash.merge!(sub_hash)
          end
        end

        def sub_hash_for(new_key, element)
          case element
          when Hash
            value = squash(element)
            prepend_to_keys(new_key, value)
          when Array
            squash_array(new_key, element)
          else
            { new_key => element }
          end
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
        def prepend_to_keys(prefix, hash)
          hash.inject({}) do |subhash, (key, value)|
            new_key = [prefix, key].join(joiner)
            subhash.merge!(new_key => value)
          end
        end
      end
    end
  end
end
