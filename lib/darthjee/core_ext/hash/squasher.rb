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
      module Squasher
        class Builder
          attr_reader :key, :value

          def initialize(key, value)
            @value = value
            @key = key
          end

          def to_h
            if value.is_a? Hash
              value.squash.inject({}) do |hash, (k, v)|
                new_key = [key, k].join('.')
                hash.merge!(new_key => v)
              end
            else
              { key => value }
            end
          end
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
        #   Darthjee::CoreExt::Hash::Squasher.squash(hash)
        #   # returns
        #   #
        #   # {
        #   #   'person.name' => 'John',
        #   #   'person.age'  => 22
        #   # }
        def self.squash(origin)
          origin.inject({}) do |hash, (key, value)|
            hash.merge!(Builder.new(key, value).to_h)
          end
        end
      end
    end
  end
end
