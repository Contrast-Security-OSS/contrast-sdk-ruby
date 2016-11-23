# Contrast::User::Api

This gem provides examples of API access to the Contrast Security Teamserver application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'contrast-user-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install contrast-user-api

## Usage

The endpoints supported by this gem are available through a common API class. 

   api = Contrast::UserApi::Api.new('path/to/configuration.yml')
   api.applications # => response object containing JSON 

The configuration can be defined in API initialization, a path defined in the "CONTRAST_SECURITY_CONFIG" environment variable or in `contrast_security.yml` in current working directory, in a config subdirectory, or in `/etc/contrast_security.yml`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To run the tests. First, rename the test configuration file in `spec/integration.yml.example` to `spec/integration.yml` and update the value to match the value in your local environment. 


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/contrast-user-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

