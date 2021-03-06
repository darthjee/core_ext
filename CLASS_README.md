## Class

### #default_value
Adds a method that will return a default value

the value is evaluated on class definition, meaning that
everytime it is called it will be the same instance

```ruby
class MyClass
  default_value :name, 'John'
end

MyClass.new.name # returns 'John'
```

```ruby
class MyClass
  default_value :name, 'John'
end

instance = MyClass.new
other = MyClass.new

instance.name.equal?('John')      # returns false
instance.name.equal?(other.name)  # returns true
```

### #default_values
Adds methods that will return a default value

the value is evaluated on class definition, meaning that
everytime any of them are called they will return the same instance
of value

```ruby
class MyClass
  default_values :name, :nick_name, 'John'
end

MyClass.new.name      # returns 'John'
MyClass.new.nick_name # returns 'John'
```

```ruby
class MyClass
  default_values :name, :nick_name, 'John'
end

instance = MyClass.new
other = MyClass.new

instance.name.equal?('John')     # returns false
instance.name.equal?(other.name) # returns true
```

```ruby
class MyClass
  default_values :name, :nick_name, 'John'
end

instance = MyClass.new

instance.nick_name.equal?('John')        # returns false
instance.nick_name.equal?(instance.name) # returns true
```

### #default_reader
Creates a method that will act as reader, but will
return a default value when the instance variable
was never set

```ruby
class Person
  attr_writer :name
  default_reader :name, 'John Doe'
end

model = Person.new

model.name # returns 'John Doe'
```

```ruby
model = Person.new
model.name # returns 'John Doe'

model.name = 'Joe'
model.name # returns 'Joe'

model.name = nil
model.name # returns nil
```

```ruby
model = Person.new
model.name # returns 'John Doe'

model.name = 'Bob'
model.name # returns 'Bob'
Person.new.name # returns 'John Doe'
```

### #default_readers
Creates methods that will act as readers, but will
return a default value when the instance variables
ware never set

```ruby
class Person
  attr_writer :cars, :houses
  default_reader :cars, :houses, 'none'
end

model = Person.new

model.cars # returns 'none'
```

```ruby
model = Person.new
model.cars # returns 'none'

model.cars = ['volvo']
model.cars # returns ['volvo']

model.cars = nil
model.cars # returns nil
```

```ruby
model = Person.new
model.cars # returns 'none'

model.cars = ['volvo']
model.cars # returns ['volvo']
Person.new.houses # returns 'none'
```

```ruby
model.cars                           # returns 'none'
model.cars.equal?('none')            # returns false
model.nick_name.equal?(model.houses) # returns true
```

## Added by Object
- [#is_any?](OBJECT_README.md#is_any?)
- [#trueful?](OBJECT_README.md#trueful?)

## Added by Class
- [.default_value](CLASS_README.md#default_value)
- [.default_values](CLASS_README.md#default_values)
- [.default_reader](CLASS_README.md#default_reader)
- [.default_readers](CLASS_README.md#default_readers)
