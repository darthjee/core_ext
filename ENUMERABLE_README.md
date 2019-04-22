## Enumerable

### #clean
Retruns a copy of the enumerator removing empty values from it

```ruby
  hash  = { b: [], c: nil, d: {}, e: '' }
  array = [1, [], nil, {}, '', hash]

  array.clean # returns [1]
```


### #clean!
Cleans empty values from an enumerator

```ruby
hash = {
  a: 1,
  b: [],
  c: nil,
  d: {},
  e: '',
  f: {
    b: [],
    c: nil,
    d: {},
    e: ''
  }
}

hash.clean! # changes hash to { a: 1 }
```

### #map_and_find

Applies ```#map``` stoping and returning on the first result
that is evaluated as false

```ruby
class Client
  def initialize(existing_ids)
    @existing_ids = existing_ids
  end

  def request(id)
    requested << id

    return unless existing_ids.include?(id)
    { id: id }
  end

  def requested
    @requested ||= []
  end

  private

  attr_reader :existing_ids
end

client = Client.new([1, 11, 21, 31, 41, 51])

ids = [10, 21, 30, 31, 51, 55]

ids.map_and_find { |id| client.request(id) } # returns { id: 21 }

client.requested # returns [10, 21]
```

### #map_and_select

Maps returning only non-false and non-nil values

```ruby
class Client
  def initialize(existing_ids)
    @existing_ids = existing_ids
  end

  def request(id)
    requested << id

    return unless existing_ids.include?(id)
    { id: id }
  end

  def requested
    @requested ||= []
  end

  private

  attr_reader :existing_ids
end

client = Client.new([1, 11, 21, 31, 41, 51])

ids = [10, 21, 30, 31, 51, 55]

ids.map_and_select do |id|
  client.request(id)
end                   # returns [{
                      #   id: 21
                      # }, {
                      #   id: 31
                      # }, {
                      #   id: 51
                      # }]
```
