# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      module Squasher
        # @api private
        #
        # @author Darthjee
        #
        # Class responsible for squashing a key and it's sub-hash
        class Builder
          attr_reader :key, :value

          # @param key [::String] main key where subhash lies
          #
          # @overload initialize(key, value)
          #   @param value [::Hash] subhash
          #
          # @overload initialize(key, value)
          #   @param value [::Object] value in the key
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
      end
    end
  end
end

