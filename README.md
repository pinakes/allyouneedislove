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
