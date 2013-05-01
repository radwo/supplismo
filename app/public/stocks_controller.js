function StocksCtrl($scope, Stock) {
  $scope.stocks = Stock.query();
  $scope.predicate = 'status_id';

  $scope.update_status = function($index, status){
    $scope.stocks[$index].status = status;
    $scope.stocks[$index].$update();
  };
};
