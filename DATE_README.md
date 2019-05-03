## Date

### #days_between

Returns the number of days between 2 dates

```ruby
date   = Date.new(2106, 10, 11)
future = date + 1.year
past   = date - 1.year

date.days_between(future)

# returns 365

date.days_between(past)

# returns 366
```

## Added by Object
- [#is_any?](ENUMERABLE_README.md#is_any?)
- [#trueful?](ENUMERABLE_README.md#trueful?)

## Added by Class
- [.default_value](CLASS_README.md#default_value)
- [.default_values](CLASS_README.md#default_values)
- [.default_reader](CLASS_README.md#default_reader)
- [.default_readers](CLASS_README.md#default_readers)
