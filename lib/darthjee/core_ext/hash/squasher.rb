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
      # @example (see .squash)
      class Squasher
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
        #   Darthjee::CoreExt::Hash::Squasher.squash(hash)
        #   # returns
        #   #
        #   # {
        #   #   'person.name' => 'John',
        #   #   'person.age'  => 22
        #   # }
        def self.squash(origin)
          new.squash(origin)
        end

        attr_reader :joiner

        def initialize(joiner = '.')
          @joiner = joiner
        end

        def squash(origin)
          origin.inject({}) do |hash, (key, value)|
            hash.merge!(build(key, value))
          end
        end

        def build(key, value)
          if value.is_a? Hash
            squash(value).inject({}) do |hash, (k, v)|
              new_key = [key, k].join(joiner)
              hash.merge!(new_key => v)
            end
          else
            { key => value }
          end
        end
      end
    end
  end
end
