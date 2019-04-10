# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
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
      end
    end
  end
end

