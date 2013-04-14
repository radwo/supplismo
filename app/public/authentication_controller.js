function AuthenticationCtrl($scope, sharedService, Authentication) {
  $scope.is_admin = sharedService.admin;
  Authentication.check_status();

  $scope.$on('handleBroadcast', function() {
    $scope.is_admin = sharedService.admin;
  });

  $scope.login = function(){
    Authentication.authenticate($scope.password);
    $scope.password = '';
  };

  $scope.logout = function(){
    Authentication.destroy();
  }
};

