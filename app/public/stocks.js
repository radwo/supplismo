angular.module('stock', ['stockService']).controller(StocksCtrl);

angular.module('stockService', ['ngResource']).
  factory('Stock', function ($resource) {
    return $resource('stocks/:stockId', {stockId:'@id'}, {
      update:  {method:'PUT'}
    });
  }).
  factory('Stocks', function($resource) {
    return $resource('stocks', {}, {
      index: {method: 'GET', isArray:true}
    });
  });

