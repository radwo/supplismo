function TodoCtrl($scope) {
  $scope.stocks = [
    {id: 3, text:'Kawa', status:"empty"},
    {id: 1, text:'Papier toaletowy', status:"medium"},
    {id: 2, text:'Kawa', status:"whole"}];
  $scope.predicate = 'status';

  $scope.all_whole = function() {
    angular.forEach($scope.stocks, function(stock) {
      stock.status = "whole";
    });
  };

  $scope.whole = function(a) {
    angular.forEach($scope.stocks, function(stock) {
      if(stock.id == a) stock.status = "whole";
    });
  };

  $scope.medium = function(a) {
    angular.forEach($scope.stocks, function(stock) {
      if(stock.id == a) stock.status = "medium";
    });
  };

  $scope.empty = function(a) {
    angular.forEach($scope.stocks, function(stock) {
      if(stock.id == a) stock.status = "empty";
    });
  };
}
