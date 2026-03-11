# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      # Class responsible for running ::Hash#chain_fetch
      #
      # @api private
      #
      # @author Darthjee
      #
      # @see Darthjee::CoreExt::Hash#chain_fetch
      class ChainFetcher
        # @param [::Hash] hash Hash to fetch from
        # @param [Array] keys List of keys to fetch in chain
        # @param [Proc] block Block to call in case of missing key
        def initialize(hash, *keys, &block)
          @hash = hash
          @keys = keys
          @block = block
        end

        # Crawls through the hash fetching the keys in chain
        #
        # @example (see Darthjee::CoreExt::Hash#chain_fetch)
        #
        # @return [Object] value fetched from hash
        def fetch
          return fetch_with_block if block.present?

          fetch_without_block
        end

        private

        attr_reader :hash, :keys, :block

        # @method hash
        # @api private
        # @private
        # Returns the hash to fetch from
        # @return [::Hash] hash to fetch from

        # @method keys
        # @api private
        # @private
        # Returns the list of keys to fetch in chain
        # @return [::Array] list of keys to fetch in chain

        # @method block
        # @api private
        # @private
        # Returns the block to call in case of missing key
        # @return [Proc] block to call in case of missing key

        # @private
        #
        # Perform chain fetch when block is given
        #
        # The block will be called in case a key is missed
        #
        # @return [Object]
        def fetch_with_block
          @hash = hash.fetch(keys.shift) do |*args|
            missed_keys = keys
            @keys = []
            block.call(*(args + [missed_keys]))
          end until keys.empty?
          hash
        end

        # @private
        #
        # Perform chain fetch when block is not given
        #
        # @return [Object]
        def fetch_without_block
          @hash = hash.fetch(keys.shift) until keys.empty?
          hash
        end
      end
    end
  end
end
