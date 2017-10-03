# cusip_style_luhn_mod_n [![CircleCI](https://circleci.com/gh/wealthsimple/cusip_style_luhn_mod_n.svg?style=svg)](https://circleci.com/gh/wealthsimple/cusip_style_luhn_mod_n)

CUSIP-style luhn mod N algorithm based on https://commons.apache.org/proper/commons-validator/apidocs/org/apache/commons/validator/routines/checkdigit/CUSIPCheckDigit.html and https://en.wikipedia.org/wiki/Luhn_mod_N_algorithm

## Installation

Add this line to your application's Gemfile and run `bundle`:

```ruby
gem 'cusip_style_luhn_mod_n'
```

## Usage

```ruby
# Check validity of check digit:
CUSIPStyleLuhnModN.valid?("A1B2C5")
=> true

CUSIPStyleLuhnModN.valid?("A1B2C4")
=> false

# Generate check digit
CUSIPStyleLuhnModN.check_digit("A1B2C")
=> 5
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
