## Hash

### #append_to_keys
Change each keys appending an string

```ruby
{ key: 1 }.append_to_keys 's'

# returns { keys: 1 }
```

### #camelize_keys
Change the keys camelizing them and accepting parameters:
- uppercase_first_letter: Use the java or javascript format (default: true)
- recursive: when true, does it recursivly through inner arrays (default: true)

```ruby
hash = { ca_b: 1, k: [{ a_b: 1 }] }

hash.camelize_keys # return { CaB: 1, K: [{ AB: 1 }] }
```

```ruby
hash = { ca_b: 1, k: [{ a_b: 1 }] }

hash.camelize_keys(recursive: false)
# returns { CaB: 1, K: [{ a_b: 1 }] }
```

```ruby
hash = { ca_b: 1, k: [{ a_b: 1 }] }

hash.camelize_keys(uppercase_first_letter: false)

# returns { caB: 1, k: [{ aB: 1 }] }
```

### #camelize_keys!
Change the keys camelizing them and accepting parameters:
- uppercase_first_letter: Use the java or javascript format (default: true)
- recursive: when true, does it recursivly through inner arrays (default: true)

```ruby
hash = { ca_b: 1, k: [{ a_b: 1 }] }

hash.camelize_keys!

# changes hash to { CaB: 1, K: [{ AB: 1 }] }
```

```ruby
hash = { ca_b: 1, k: [{ a_b: 1 }] }

hash.camelize_keys!(recursive: false)

# changes hash to { CaB: 1, K: [{ a_b: 1 }] }
```

```ruby
hash = { ca_b: 1, k: [{ a_b: 1 }] }

hash.camelize_keys!(uppercase_first_letter: false)

# changes hash to { caB: 1, k: [{ aB: 1 }] }
```

### #chain_change_keys
Returns new hash changing the keys using a chained method call

```ruby
{ ca_b: 1 }.chain_change_keys(:to_s, :upcase, :to_sym)

# returns { CA_B: 1 }
```

### #chain_change_keys!
Change the hash keys using a chained method call

```ruby
{ ca_b: 1 }.chain_change_keys!(:to_s, :upcase, :to_sym)

# changes hash to { CA_B: 1 }
```

### #chain_fetch
Applies fetch in a chain

```ruby
hash = { a: { b: { c: { d: 10 } } } }

hash.chain_fetch(:a, :b, :c, :d) # returns 10
```

A block can be passed so that when a key is not found, the block will define the value to be returned

```ruby
hash = { a: { b: { c: { d: 10 } } } }

hash.chain_fetch(:a, :x, :y, :z) do |key, missed_keys|
  "returned: #{key}\nmissed: [#{missed_keys.join(',')}]"
end

# returns "returned x\nmissed: [y,z]"
```

### #change_keys
Change the array keys using a block accepting parameters:
 - recursive: when true, does it recursivly through inner arrays (default: true)

```ruby
{ ca_b: 1, k: [{ a_b: 1 }] }.change_keys { |k| k.to_s.upcase }

# reutrns {"CA_B"=>1, "K"=>[{"A_B"=>1}]}
```

```ruby
{ ca_b: 1, k: [{ a_b: 1 }] }.change_keys(recursive: false) { |k| k.to_s.upcase }

# returns {"CA_B"=>1, "K"=>[{:a_b=>1}]}
```

### #change_keys!
Change the array keys using a block accepting parameters:
 - recursive: when true, does it recursivly through inner arrays (default: true)

```ruby
{ ca_b: 1, k: [{ a_b: 1 }] }.change_keys! { |k| k.to_s.upcase }

# changes hash to {"CA_B"=>1, "K"=>[{"A_B"=>1}]}
```

```ruby
{ ca_b: 1, k: [{ a_b: 1 }] }.change_keys!(recursive: false) { |k| k.to_s.upcase }

# changes hash to {"CA_B"=>1, "K"=>[{:a_b=>1}]}
```

### #change_values
Returns new hash changing the values of the hash, accepting parametes:
 - recursive: when true, does it recursivly through inner arrays and hashes (default: true)
 - skip_inner: when true, do not call the block for iterators such as Hash and Arrays (default: true)

```ruby
hash = { a: 1, b: [{ c: 2 }] }

hash.change_values { |v| (v+1).to_s }

# returns { a: '2', b: [{ c: '3' }] }
```

```ruby
hash = { a: 1, b: [{ c: 2 }] }
hash.change_values(recursive: false) { |v| (v+1).to_s }

# returns { a: '2' b: [{ c: 2 }] }
```

```ruby
hash = { a: 1, b: [{ c: 2 }], d: { e: 3 } }
hash.change_values(skip_inner: false) do |v|
  case value
  when Integer
    (value + 1).to_s
  when Hash
    value.to_s
  else
    value.class
  end
end

# returns { a: '2' b: Array, d: "{:e=>3}" }
```

### #change_values!
Change the values of the hash accepting parametes:
 - recursive: when true, does it recursivly through inner arrays and hashes (default: true)
 - skip_inner: when true, do not call the block for iterators such as Hash and Arrays (default: true)

```ruby
hash = { a: 1, b: [{ c: 2 }] }

hash.change_values! { |v| (v+1).to_s }

# changes hash to { a: '2', b: [{ c: '3' }] }
```

```ruby
hash = { a: 1, b: [{ c: 2 }] }
hash.change_values!(recursive: false) { |v| (v+1).to_s }

# changes hash to { a: '2' b: [{ c: 2 }] }
```

```ruby
hash = { a: 1, b: [{ c: 2 }], d: { e: 3 } }
hash.change_values!(skip_inner: false) do |v|
  case value
  when Integer
    (value + 1).to_s
  when Hash
    value.to_s
  else
    value.class
  end
end

# changes hash to { a: '2' b: Array, d: "{:e=>3}" }
```

### #exclusive_merge
Like #merge but only for existing keys

```ruby
{ a: 1, b: 2 }.exclusive_merge(b: 3, c: 4)

# returns { a: 1, b: 3 }
```

### #exclusive_merge!
Like #merge! but only for existing keys

```ruby
{ a: 1, b: 2 }.exclusive_merge!(b: 3, c: 4)

# changes hash to { a: 1, b: 3 }
```

### #lower_camelize_keys
Alias for [#camelize_keys](camelize_keys)(uppercase_first_letter: false)

```ruby
hash = { ca_b: 1, k: [{ a_b: 1 }] }

hash.lower_camelize_keys
# returns { caB: 1, k: [{ aB: 1 }] }
```

### #lower_camelize_keys!
Alias for [#camelize_keys](camelize_keys)(uppercase_first_letter: false)

```ruby
hash = { ca_b: 1, k: [{ a_b: 1 }] }

hash.lower_camelize_keys!
# changes hash to { caB: 1, k: [{ aB: 1 }] }
```

### #map_to_hash
map returning a hash with the original keys for keys

```ruby
hash = { a: 1, b: 2 }

hash.map_to_hash { |k, v| "#{k}_#{v}" }

# returns { a: 'a_1', b: 'b_2' }
```

### #prepend_to_keys
Change each keys prepending an string

```ruby
{ key: 1 }.prepend_to_keys 'scope:'

# returns { :'scope:key' => 1 }
```

### #remap_keys
Returns new hash changing the keys of the hash based
on a map of { old: new } value

```ruby
hash = { a: 1, b: 2 }
hash.remap_keys(a: :c, d: :e)

# returns { c: 1, b: 2, e: nil }
```

### #remap_keys!
Changes the keys of the hash based on a map of { old: new } value

```ruby
hash = { a: 1, b: 2 }
hash.remap_keys!(a: :c, d: :e)

# change hash to { c: 1, b: 2, e: nil }
```

### #sort_keys
Sort the hash usig the keys

```ruby
{ b: 1, a: 2 }.sort_keys.keys

# returns [:a, :b]
```

### #sort_keys!
Sort the hash usig the keys

```ruby
hash = { b: 1, a: 2 }
hash.sort_keys
hash.keys

# returns [:a, :b]
```

### #squash
Squash a deep hash into a simple level hash

```ruby
{ a: { b: [1, 2] } }.squash

#returns { 'a.b[0]' => 1, 'a.b[1]' => 2 }
```

### #squash!
Squash a deep hash into a simple level hash

```ruby
{ a: { b: [1, 2] } }.squash!

# changes hash to { 'a.b[0]' => 1, 'a.b[1]' => 2 }
```

### #underscore_keys
Creates a new hash changing keys from camelcase to snakecase (underscore)

options:
 - recursive: when true, does it recursivly through inner arrays (default: true)

```ruby
hash = { Ca_B: 1, 'kB' => [{ KeysHash: 1 }] }

hash.underscore_keys
# returns { ca_b: 1, 'k_b' => [{ keys_hash: 1 }] }
```

### #underscore_keys!
Change the keys from camelcase to snakecase (underscore)

options:
 - recursive: when true, does it recursivly through inner arrays (default: true)

```ruby
hash = { Ca_B: 1, 'kB' => [{ KeysHash: 1 }] }

hash.underscore_keys!
# changes hash to { ca_b: 1, 'k_b' => [{ keys_hash: 1 }] }
```

### #transpose
swap keys with values of the hash

```ruby
{ a: 1, b: :a, c: [2, 3] }.transpose

# returns { 1 => :a, a: :b, [2, 3] => :c }
```

### #transpose!
Changes hash swapping keys with values of the hash

```ruby
{ a: 1, b: :a, c: [2, 3] }.transpose!

# changes hash to { 1 => :a, a: :b, [2, 3] => :c }
```

### #to_deep_hash
Changes a hash spliting keys into inner hashs

```ruby
hash = { 'a.b[0]' => 1, 'a.b[1]' => 2 }
hash.to_deep_hash

# returns { 'a' => { 'b' => 1 } }
```

### #to_deep_hash!
Changes a hash spliting keys into inner hashs

```ruby
hash = { 'a.b[0]' => 1, 'a.b[1]' => 2 }
hash.to_deep_hash!

# changes hash to { 'a' => { 'b' => 1 } }
```

## Added by Enumerable
- [#clean](ENUMERABLE_README.md#clean)
- [#clean!](ENUMERABLE_README.md#clean!)
- [#map_and_find](ENUMERABLE_README.md#map_and_find)
- [#map_and_select](ENUMERABLE_README.md#map_and_select)
- [#map_to_hash](ENUMERABLE_README.md#map_to_hash)

## Added by Object
- [#is_any?](OBJECT_README.md#is_any?)
- [#trueful?](OBJECT_README.md#trueful?)

## Added by Class
- [.default_value](CLASS_README.md#default_value)
- [.default_values](CLASS_README.md#default_values)
- [.default_reader](CLASS_README.md#default_reader)
- [.default_readers](CLASS_README.md#default_readers)
