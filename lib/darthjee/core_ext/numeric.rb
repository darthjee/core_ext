# frozen_string_literal: true

module Darthjee
  module CoreExt
    # @api public
    module Numeric
      # Returns the percentage over total
      #
      # @param total [::Numeric] total over which to calculate
      #   the percentage
      #
      # @return [::Float]
      #
      # @example
      #   10.percent_of(30) # returns 33.33333333333333
      def percent_of(total)
        return Float::INFINITY if total.to_f&.zero?

        (to_f / total) * 100.0
      end
    end
  end
end

class Numeric
  include Darthjee::CoreExt::Numeric
end
