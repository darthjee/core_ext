## Array
### #average
returns the average of the values in the array

```ruby
array = [1, 2, 3, 4]
array.average # returns 2.5
```

### #chain_map
applies map in a chain

```ruby
array = [ :a, :long_name, :sym ]
array.chain_map(:to_s, :size, :to_s)
[ '1', '9', '3' ]
```

```ruby
array = [ :a, :long_name, :sym ]
array.chain_map(:to_s, :size) { |v| "final: #{v}" }
[ 'final: 1', 'final: 9', 'final: 3' ]
```

### #as_hash
Creates a hash from the array using the argument array as keys

```ruby
array = [10, 20, 30, 40]
keys  = %i[ten twenty thirty fourty]

array.as_hash(keys) # returns {
                    #   ten: 10,
                    #   twenty: 20,
                    #   thirty: 30,
                    #   fourty: 40
                    # }
```

## Added by Enumerable
- [#clean](ENUMERABLE_README.md#clean)
- [#clean!](ENUMERABLE_README.md#clean!)
- [#map_and_find](ENUMERABLE_README.md#map_and_find)
- [#map_and_select](ENUMERABLE_README.md#map_and_select)
- [#map_to_hash](ENUMERABLE_README.md#map_to_hash)
