angular.module('sharedModule',[]).factory('sharedService', function($rootScope) {
    var sharedService = {};

    sharedService.admin = false;

    sharedService.prepForBroadcast = function(is_admin) {
        this.admin = is_admin;
        this.broadcastItem();
    };

    sharedService.broadcastItem = function() {
        $rootScope.$broadcast('handleBroadcast');
    };

    return sharedService;
});
