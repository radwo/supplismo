function RequestsCtrl($scope, Request, $resource, $cookies, sharedService) {
  $scope.user_token = $cookies.user_token;
  $scope.requests = Request.query();
  $scope.predicate = 'id';
  $scope.reverse   = true;
  $scope.request = new Request();
  $scope.is_admin = sharedService.admin;

  $scope.$on('handleBroadcast', function() {
    $scope.is_admin = sharedService.admin;
  });

  $scope.create = function(){
    if($scope.newRequest.$valid) {
      $scope.request.$save();
      $scope.requests.push($scope.request);
      $scope.request = new Request();
    }
  };

  $scope.remove = function($index){
    if($scope.reverse) {
      $index = $scope.requests.length - 1 - $index;
    }
    var request = $scope.requests[$index];
    if(request.user_token == $cookies.user_token) {
      request.$delete();
      $scope.requests.splice($index, 1);
    }
  };

  $scope.can_remove_request = function($index){
    var request = $scope.requests[$index];
    return request.user_token == $cookies.user_token || $scope.is_admin;
  };
};
