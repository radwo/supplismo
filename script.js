function ProviderCtrl($scope) {
  $scope.stocks = [
    {text:'Kawa', status:"empty"},
    {text:'Papier toaletowy', status:"medium"},
    {text:'Woda', status:"whole"}];
  $scope.predicate = 'status';

  $scope.setAllAsWhole = function() {
    angular.forEach($scope.stocks, function(stock) {
      stock.status = "whole";
    });
  };

  $scope.setStatus = function(name, status) {
    angular.forEach($scope.stocks, function(stock) {
      if(stock.text == name) stock.status = status;
    });
  };
}
