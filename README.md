# Feint

Feint is a Presenter Layer for models. When developing APIs, attributes change from version to version.
Controllers contain lots of code to transform attribute names of models and parameter content to fit clients.
Feint is aiming at wrapping your models for serialization in different situations. Major features of Feint
is to

- Transform attributes of models from one name to another name for serialization.
- Convert keys of parameters from one name to another name for model initialization.
- Lock mandatory and optional columns used in a presenter.

Advanced features will include

- Nested Presentation. If some attributes are from associations, delegate them to presenters of associations.
- GraphQL Support. Being the glue of GraphQL type definitions and legacy models

From perspective of a serializer, a Feint preseter acts as the model it presents except for different
attribute names. You can replace a model instance with its Feint presenter and it will work seamelessly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'feint'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install feint

## Usage

Consider we have a model `User`.

```ruby
class User < ActiveRecord::Base
  connection.create_table table_name do |f|
    f.string  :name
    f.integer :age
  end
end
```

This presenter will take its attributes `name` and `age`

```ruby
class UserPresenter < Feint::Presenter
  attributes :name, :age
end
```

This presenter could be passed to the serializer

```ruby
class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render json: UserPresenter.new(@user)
  end
end
```

And render expected result

```json
{
  "name": "USER NAME",
  "age":  "USER AGE",
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shelling/feint. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

