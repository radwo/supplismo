'use strict';

angular.module('app', ['stockService', 'requestService', 'sharedModule', 'authenticationService','ngCookies']).
controller(StocksCtrl).
controller(RequestsCtrl).
controller(AuthenticationCtrl).
config(['$routeProvider', function ($routeProvider) {
  $routeProvider.when('/', { templateUrl: '/stocks.html', controller: StocksCtrl, activetab: 'stocks'});
  $routeProvider.when('/special', { templateUrl: '/special.html', controller: RequestsCtrl});
}]);
