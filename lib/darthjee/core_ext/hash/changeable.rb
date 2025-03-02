# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      # Methods responsible for changing hash values
      #
      # @api public
      #
      # @author Darthjee
      module Changeable
        # Creates a new hash with changes in its values
        #
        # @param options [::Hash]
        # @option options [::TrueClass,::FalseClass]
        #   recursive (true) flag indicating recursive sorting
        # @option options [::TrueClass,::FalseClass]
        #   skip_inner (true) Flag indicating to skip running
        #   transformation on Hash objects
        #
        # @yield (value) changing value block
        #
        # @return [::Hash]
        #
        # @example Simple Usage
        #   hash = { a: 1, b: 2 }
        #   hash.change_values do |value|
        #     value + 1
        #   end                     # returns { a: 2, b: 3 }
        #
        # @example Skipping inner hash transformation
        #   hash = { a: 1, b: { c: 1 } }
        #
        #   hash.change_values(&:to_s)) # returns {
        #                               #   a: "1",
        #                               #   b: { c: "1" }
        #                               # }
        #
        # @example Not skipping inner hash transformation
        #   hash = { a: 1, b: { c: 1 } }
        #
        #   hash.change_values(skip_inner: false, &:to_s))
        #                               # returns {
        #                               #   a: "1",
        #                               #   b: "{:c=>1}"
        #                               # }
        def change_values(**, &)
          deep_dup.change_values!(**, &)
        end

        # Changes the values of a hash
        #
        # @param options [::Hash]
        # @option options [::TrueClass,::FalseClass]
        #   recursive (true) flag indicating recursive sorting
        # @option options [::TrueClass,::FalseClass]
        #   skip_inner (true) Flag indicating to skip running
        #   transformation on Hash objects
        #
        # @yield (value) changing value block
        #
        # @return [::Hash]
        #
        # @example (see change_values)
        #
        # @example Changing inner hash
        #   inner_hash = { c: 2 }
        #   hash = { a: 1, b: inner_hash }
        #
        #   hash.change_values!(&:to_s)
        #
        #   inner_hash # changed to { c: "2" }
        #
        # @example Not changing inner hash
        #   inner_hash = { c: 2 }
        #   hash = { a: 1, b: inner_hash }
        #
        #   hash.change_values!(skip_inner: false, &:to_s)
        #
        #   hash       # changed to { a: "1", b: "{:c=>2}" }
        #   inner_hash # still      { c: 2 }
        def change_values!(**, &)
          Hash::ValueChanger.new(**, &).change(self)
        end
      end
    end
  end
end
