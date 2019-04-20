# frozen_string_literal: true

module Darthjee
  module CoreExt
    # @api public
    module Object
      # Checks if object is any of the given classes
      #
      # @param classes [::Array<::Class>] classes to be checked
      #   against
      #
      # @return [::TrueClass,::FalseClass]
      def is_any?(*classes)
        classes.any? do |clazz|
          is_a?(clazz)
        end
      end
    end
  end
end

class Object
  include Darthjee::CoreExt::Object
end
