angular.module('app', ['stockService', 'requestService', 'sharedModule', 'authenticationService','ngCookies']).
  controller(StocksCtrl).
  controller(RequestsCtrl).
  controller(AuthenticationCtrl);
