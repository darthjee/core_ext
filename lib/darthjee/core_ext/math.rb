# frozen_string_literal: true

module Darthjee
  module CoreExt
    # @api public
    module Math
      # Calculates avarage from a series of values
      #
      # @overload average(values)
      #   @param values [::Array] list of values
      #
      # @overload average(values)
      #   @param values [::Hash] hash of values and its weights
      #
      # @return [::Float]
      #
      # @example Average of array
      #   values = [1,2,3,4]
      #
      #   Math.average(values) # returns 2.5
      #
      # @example Average of hash
      #   values = { 1 => 3, 7 => 1 }
      #
      #   Math.average(values) # returns 2.5
      def average(values)
        if values.is_a?(Hash)
          weight_sum = values.values.sum
          values = values.map { |value, weight| value * weight }
        else
          weight_sum = values.length
        end

        values.sum / weight_sum.to_f
      end
    end
  end
end

module Math
  extend Darthjee::CoreExt::Math
end
