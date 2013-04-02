function StocksCtrl($scope, Stock) {
  $scope.stocks = Stock.query();
  $scope.predicate = 'status_id';

  $scope.update = function(stock, status){
    stock.status = status;
    stock.$update(function(s){
      stock = s;
    });
  };
};
