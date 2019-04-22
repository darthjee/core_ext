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
      #
      # @example
      #   object = [1, 2, 3]
      #
      #   object.is_any?(Hash,  Class)      # false
      #   object.is_any?(Hash,  Array)      # true
      #   object.is_any?(Enumerable, Class) # true
      def is_any?(*classes)
        classes.any? do |clazz|
          is_a?(clazz)
        end
      end

      def truthy?
        !! self
      end
    end
  end
end

class Object
  include Darthjee::CoreExt::Object
end
