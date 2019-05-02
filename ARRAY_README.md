## Array
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

### #average
Returns the average of the values in the array

```ruby
array = [1, 2, 3, 4]
array.average # returns 2.5
```

### #chain_map
applies map in a chain

```ruby
array = [ :a, :long_name, :sym ]
array.chain_map(:to_s, :size, :to_s)

# returns [ '1', '9', '3' ]
```

```ruby
array = [ :a, :long_name, :sym ]
array.chain_map(:to_s, :size) { |v| "final: #{v}" }
[ 'final: 1', 'final: 9', 'final: 3' ]
```

### #mapk
Maps by fetching values from hashes inside array

```ruby
array = [
  { a: { b: 1 }, b: 2 },
  { a: { b: 3 }, b: 4 }
]

array.mapk(:a, :b) # return [1, 3]
```

### #procedural_join
Maps values to strings and joins then by evaluating which
string to be used on joining

```ruby
mapper = proc { |value| value.to_f.to_s }
array.procedural_join(mapper) do |_previous, nexte|
  nexte.positive? ? ' +' : ' '
end     # returns '1.0 +2.0 -3.0 -4.0 +5.0'
```

### #random
Returns a random element of the array

```ruby
array = [10, 20, 30]
array.random                  # returns any of the elements
array.include?(array.random!) # returns true
```

### #random!
Removes a random element of the array

```ruby
array = [10, 20, 30]
array.random! # returns any of the elements

array = [10, 20, 30]
array.include?(array.random!) # returns false
```

## Added by Enumerable
- [#clean](ENUMERABLE_README.md#clean)
- [#clean!](ENUMERABLE_README.md#clean!)
- [#map_and_find](ENUMERABLE_README.md#map_and_find)
- [#map_and_select](ENUMERABLE_README.md#map_and_select)
- [#map_to_hash](ENUMERABLE_README.md#map_to_hash)

## Added by Object
- [#is_any?](ENUMERABLE_README.md#is_any?)
- [#trueful?](ENUMERABLE_README.md#trueful?)
