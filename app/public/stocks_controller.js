function StocksCtrl($scope, Stock, Stocks) {
  $scope.stocks = Stocks.index();
  $scope.predicate = 'status';

  $scope.update = function(stockId,status) {
    var stock = Stock.get({stockId: stockId}, function(){
      stock.$update({status:status}, function(){
        $scope.stocks = Stocks.index();
      });
    });
  };
};
