# ActiveInteractor

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ActiveInteractor`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_interactor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_interactor

## Usage

This gem has some instances that can help you with your work:
1) Immutable valueObject
2) Operation with validations of input parameters and context
  ```ruby
   class ExampleOperation < ActiveInteractor::Operation
  
      validate :id, :custom_validation # <- function name for validation
      validate :id, 'ExampleValidation' # <- class name, calls `validate` method
  
      def custom_validation(*args)
        object = args.first
        object.context.id == nil
      end
      
      def before_call(*args) # <- this method is executed before exec
        print(args)
      end
  
      def exec(args = {}) # <- method executed on `call` of this class 
        context.id = args[:id]
        context.new_id = 2
        context
      end
      
      def after_call(*args) # <- this method is executed after exec
        print(context.success?)
      end
    end
  ```
  
#TODO:
1) move validations to external package
2) implement chain of operations pattern  

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ActiveInteractor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveInteractor project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ActiveInteractor/blob/master/CODE_OF_CONDUCT.md).
