Start server
rackup

Create new stock
curl -X POST -d "name=text" http://localhost:9292/stocks

Delete stock with id = 1
curl -X DELETE http://localhost:9292/stocks/1

List all stocks
curl -X GET http://localhost:9292/stocks

Update stock with id = 1
curl -X PUT -d "status=whole" http://localhost:9292/stock/1
