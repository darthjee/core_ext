# frozen_string_literal: true

module Darthjee
  module CoreExt
    # @api public
    #
    # @author darthjee
    module Symbol
      # Creates new symbol camelized
      #
      # @param first_letter [::Symbol] type of first letter
      #
      # @return [::Symbol]
      #
      # @example
      #   :the_symbol.camelize # returns :TheSymbol
      def camelize(first_letter = :upper)
        to_s.camelize(first_letter).to_sym
      end

      # The reverse of {#camelize}
      #
      # Makes an underscored, lowercase form from
      # the expression in the Symbol
      #
      # @return [::Symbol]
      #
      # @example
      #   :theSymbol.camelize # returns :the_symbol
      def underscore
        to_s.underscore.to_sym
      end
    end
  end
end

class Symbol
  include Darthjee::CoreExt::Symbol
end
