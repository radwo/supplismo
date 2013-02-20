angular.module('stock', ['stockService']).controller(StocksCtrl);

angular.module('stockService', ['ngResource']).
  factory('Stock', function ($resource) {
    return $resource("/stocks/:id", {id: "@id"}, {update: {method: "PUT"}});
  });

