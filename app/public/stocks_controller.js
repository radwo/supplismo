function StocksCtrl($scope, Stock) {
  $scope.stocks = Stock.query();
  $scope.predicate = 'status_id';

  $scope.update = function(stock, status){
   stock.$update({status:status});
   stock.$get(function(s){
     stock = s;
   });
  };
};
