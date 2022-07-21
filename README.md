# axio

An API wrapper to the AxiomXa specification.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     axio:
       github: place-technology/axio
   ```

2. Run `shards install`

## Usage

```crystal
require "axio"

client = Axio::Client.new(base_url: "http://127.0.0.1:60001", username: "test", password: "test")

response = client.access_points.all
pp JSON.parse(response.body)
```

## Contributing

1. Fork it (<https://github.com/place-technology/axio/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Giorgi Kavrelishvili](https://github.com/grkek) - creator and maintainer
