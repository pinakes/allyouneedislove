# All You Need Is Love

## Start redis server

```bash
$ redis-server
```

## Start web server

```bash
$ REDISTOGO_URL=redis://localhost:6379 rackup
```

## Start console

```bash
$ REDISTOGO_URL=redis://localhost:6379 bundle exec irb -r ./app.rb
```

## Note about files download

To check Filepicker.io API response headers run:

```bash
curl -v https://www.filepicker.io/api/file/HXTmWL4VTeHL6jRERQbf?dl=false -o /dev/null
```

The `dl=false` param is used to get files without the `Content-Disposition` header.

## Play with Redis in production

Start heroku console

```bash
$ heroku console
```

Require `app.rb`

```ruby
require './app.rb'
# => true
```

List all items in `songs` (see also: http://redis.io/commands/lrange)

```ruby
REDIS.lrange 'songs', 0, -1
# => ["https://www.filepicker.io/api/file/wcr8ycSRN2TCUtLtgySd"]
```

Add an item to `songs` list (see also: http://redis.io/commands/lpush)

```ruby
REDIS.lpush 'songs', 'test'
# => 2
REDIS.lrange 'songs', 0, -1
# => ["test", "https://www.filepicker.io/api/file/wcr8ycSRN2TCUtLtgySd"]
```

Remove all occurrences of `test` item from `songs` list (see also: http://redis.io/commands/lrem)

```ruby
REDIS.lrem 'songs', 0, 'test'
# => 1
REDIS.lrange 'songs', 0, -1
# => ["test", "https://www.filepicker.io/api/file/wcr8ycSRN2TCUtLtgySd"]
```