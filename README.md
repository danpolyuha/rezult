# Rezult

Rezult is a very lightweight gem for communication with service classes and subroutines.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rezult'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rezult

## Usage

It's nice to keep results of all the calls to different service classes and subroutines in a unified manner throughout
your project. This is exactly what this small class is for. Inheriting from `OpenStruct`, it encapsulates logic of
method success/failure, resulting data and error messages.

You create `Rezult` object using class methods `.success` or `.fail`, passing resulting data or error message,
respectively:
```ruby
return Rezult.success(key1: value1, key2: value2)

return Rezult.fail("Error message.")
```
Then, in caller, you can use the following:
```ruby
r.success?
r.failed?
r.key1
r.key2
r.error_message
```

Your code might look like:
```ruby
require 'rezult'

class MyService
  def perform
    # do your stuff
    # passed = ...
    # key = ...
    # model = ...
    
    if passed
      Rezult.success(key: key, model: model)
    else
      Rezult.fail("Sorry dude, it didn't work out.")
    end
  end
end

class MyServiceUsingClass
  def do_stuff
    service = MyService.new
    result = service.perform
    if result.success?
      return {result.key => result.model}
    else
      raise MyException.new(result.error_message)
  end
end
```

## Error messages
 
`fail` method accepts a single error message or an array. Array will be joined with new line symbol for representation in `error_message` method. You also have `error_messages` method for accessing the original array.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danpolyuha/rezult. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rezult project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rezult/blob/master/CODE_OF_CONDUCT.md).
