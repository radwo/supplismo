angular.module('authenticationService',[]).
  service('Authentication', function ($http, sharedService) {
    this.authenticate = function(password){
      $http.post('/authentication', {password: password}).
        success(function(){ sharedService.prepForBroadcast(true) }).
        error(function(){ sharedService.prepForBroadcast(false); });
    };

    this.check_status = function(){
      $http.get('/authentication').
        success(function(){ sharedService.prepForBroadcast(true) }).
        error(function(){ sharedService.prepForBroadcast(false); });
    };

    this.destroy = function(){
      $http.delete('/authentication').
        success(function(){ sharedService.prepForBroadcast(false) });
    }
  });

