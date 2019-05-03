## Object

### #is_any?
returns if the object is an instance of any of the given classes

```ruby
1.is_any?(String, Symbol)

# returns false
```

```ruby
1.is_any?(String, Symbol, Numeric)

# returns true
```

## #trueful?

```ruby
nil.trueful?         # returns false
[].trueful?          # returns true
{}.trueful?          # returns true
"".trueful?          # returns true
0.trueful?           # returns true
Object.new.trueful?  # returns true
```
