function StocksCtrl($scope, Stock) {
  $scope.stocks = Stock.query();
  $scope.predicate = 'status';

  $scope.update = function(stock, status){
    stock.status = status;
    stock.$update({status:status});
  };
};
