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

