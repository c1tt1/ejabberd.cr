# ejabberd.cr

A Crystal library to easily communicate with the ejabberd admin API.
It implements all [ejabberd rest api reference](https://docs.ejabberd.im/developer/ejabberd-api/admin-api/).\
This library is small and simple, it can be read and understood in no more than 10 minutes.


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

This library implements same method names as the [ejabberd rest api reference](https://docs.ejabberd.im/developer/ejabberd-api/admin-api/) and take same value types as the api reference.\
For example [add_rosteritem](https://docs.ejabberd.im/developer/ejabberd-api/admin-api/#add-rosteritem) in the api reference like the following:

```json
POST /api/add_rosteritem
{
  "localuser": "user1",
  "localserver": "myserver.com",
  "user": "user2",
  "server": "myserver.com",
  "nick": "User 2",
  "group": "Friends",
  "subs": "both"
}

HTTP/1.1 200 OK
""
```

With this library the above becomes the following:
```crystal
ejabberd.add_rosteritem("user1", "myserver.com", "user2", "myserver.com", "User 2", "Friends", "both")
```

You can also add the argument names like the following:
```crystal
ejabberd.add_rosteritem(localuser: "user1", localserver: "myserver.com", user: "user2", server: "myserver.com", nick: "User 2", group: "Friends", subs: "both")
```

#### Return types
Each method return an [`HTTP::Client::Response`](https://crystal-lang.org/api/0.24.1/HTTP/Client/Response.html) instance, so you can any call methods like [`body`](https://crystal-lang.org/api/0.24.1/HTTP/Client/Response.html#body-instance-method) or [`status_code`](https://crystal-lang.org/api/0.24.1/HTTP/Client/Response.html#status_message%3AString-instance-method) on it.

#### Memory footprint
The library resides on the stack which makes it fast and cheap due to to no allocation on the heap.

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
