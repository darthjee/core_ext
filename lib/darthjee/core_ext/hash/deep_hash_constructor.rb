# frozen_string_literal: true

module Darthjee
  module CoreExt
    module Hash
      # @api private
      #
      # @author Darthjee
      #
      # Class responsible for creating a Hash deep hash
      #
      # Deep hash construction happens when a hash of one layer
      # (no sub hashes) has keys that, once explitted, can be
      # assembled in a hash with many layers
      #
      # @example General Usage
      #   hash = {
      #     'account.person.name' => 'John',
      #     'account.person.age'  =>  20,
      #     'account.number'      => '102030',
      #     :'house.number'       => 67,
      #     :'house.zip'          => 12_345
      #   }
      #
      #   constructor = Darthjee::CoreExt::Hash::DeepHashConstructor.new('.')
      #
      #   constructor.deep_hash(hash)  # returns {
      #                                #   'account' => {
      #                                #     'person' => {
      #                                #       'name'   => 'John',
      #                                #       'age'    =>  20
      #                                #     },
      #                                #     'number' => '102030',
      #                                #   },
      #                                #   'house' => {
      #                                #     'number' => 67,
      #                                #     'zip'    => 12345
      #                                #   }
      #                                # }
      class DeepHashConstructor
        autoload :Setter, "#{PATH}/hash/deep_hash_constructor/setter"

        attr_accessor :separator

        # @param separator [::String] keys splitter
        def initialize(separator)
          @separator = separator
        end

        # Performs deep hash transformation
        #
        # @param hash [::Hash]
        #
        # @return [::Hash]
        #
        # @example (see DeepHashConstructor)
        def deep_hash(hash)
          hash_deep_hash(hash)
        end

        private

        # @private
        #
        # Map array performing deep hash on its Hash elements
        #
        # @param array [::Array] array to be mapped
        #
        # @return [::Array]
        def array_deep_hash(array)
          array.map do |value|
            proccess_value(value)
          end
        end

        # @private
        #
        # Map Hash to new deep hashed Hash
        #
        # @param hash [::Hash]
        #
        # @return [::Hash]
        def hash_deep_hash(hash)
          break_keys(hash).tap do |new_hash|
            new_hash.each do |key, value|
              new_hash[key] = proccess_value(value)
            end
          end
        end

        # @private
        # break the keys creating sub-hashes
        #
        # @param hash [::Hash] hash to be broken
        #
        # @example Breaking many level keys
        #   hash = {
        #     'account.person.name' => 'John',
        #     'account.person.age'  =>  20,
        #     'account.number'      => '102030',
        #     :'house.number'       => 67,
        #     :'house.zip'          => 12_345
        #   }
        #
        #   constructor = Darthjee::CoreExt::Hash::DeepHashConstructor.new('.')
        #
        #   constructor.send(:break_keys, hash)
        #
        #   # Returns {
        #   #   'account' => {
        #   #     'person.name' => 'John',
        #   #     'person.age'  =>  20,
        #   #     'number'      => '102030'
        #   #   },
        #   #   'house' => {
        #   #     'number' => 67,
        #   #     'zip'    => 12_345
        #   #   }
        #   # }
        #
        # @return [Hash]
        def break_keys(hash)
          {}.tap do |new_hash|
            hash.each do |key, value|
              base_key, child_key = split_key(key, separator)
              Setter.new(new_hash, base_key).set(child_key, value)
            end
          end
        end

        def proccess_value(object)
          if object.is_a? Array
            array_deep_hash(object)
          elsif object.is_a? Hash
            hash_deep_hash(object)
          else
            object
          end
        end

        # @private
        #
        # Split key into array of keys
        #
        # @param key [::String,::Symbol] key to be splitted
        # @param separator [::String] string of key splitting
        #
        # @return [::Array<::String>,::String]
        def split_key(key, separator)
          keys = key.to_s.split(separator)
          return key.to_s unless keys.second

          [keys.first, keys[1..-1].join(separator)]
        end
      end
    end
  end
end
