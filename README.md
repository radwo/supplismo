# Supplismo

Simply app to manage office supplies

## Usage

Start app:

    $ rackup

Create new stock:

    $ curl -X POST -d "name=text" http://localhost:9292/stocks

Delete stock with id = 1:

    $ curl -X DELETE http://localhost:9292/stocks/1

List all stocks:

    $ curl -X GET http://localhost:9292/stocks

Update stock with id = 1:

    $ curl -X PUT -d "status=whole" http://localhost:9292/stock/1

## TODO

1. Add tests
2. Improve UI

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
