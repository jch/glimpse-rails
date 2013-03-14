# Glimpse::Rails

A [glimpse](https://github.com/dewski/glimpse) plugin for reporting on Rails.

## Installation

Add this line to your application's Gemfile:

    gem 'glimpse-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install glimpse-rails

## Usage

Setup [glimpse](https://github.com/dewski/glimpse#usage), then add this into
your initializer:

```ruby
Glimpse.into Glimpse::Views::Rails
```

## Caveats

This only works for full html responses that have a closing body tag. I plan
on removing this restriction, but it was simplier to implement with the
constraint. See `glimpse/rails/railtie.rb` for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
