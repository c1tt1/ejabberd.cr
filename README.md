# ejabberd.cr

A Crystal library to easily communicate with the ejabberd admin API

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  ejabberd:
    github: stern0/ejabberd.cr
```

## Usage

```crystal
require "ejabberd"

# ejabberd = Ejabberd.new "api_url"
ejabberd = Ejabberd.new "http://127.0.0.1:5280"

```

## Development

This project requires a locally running ejabberd server running with http api set in ejabberd.yml file.
The test specs are currently in implementation.

## Contributing

1. Fork it ( https://github.com/stern0/ejabberd.cr/ )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- Bug reports and pull requests are welcome on GitHub at [stern0](https://github.com/stern0) - creator, maintainer
