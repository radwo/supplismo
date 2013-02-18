function StocksCtrl($scope, Stock, Stocks) {
  $scope.stocks = Stocks.index();
  $scope.predicate = 'status';

  $scope.update = function(stock, status){
    stock.status = status;
    new Stock(stock).$update({status:status});
  };
};
