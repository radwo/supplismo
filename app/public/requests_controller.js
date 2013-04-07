function RequestsCtrl($scope, Request, $resource, $cookies) {
  $scope.user_token = $cookies.user_token;
  $scope.requests = Request.query();
  $scope.predicate = 'id';
  $scope.reverse   = true;
  $scope.request = new Request();

  $scope.create = function(){
    if($scope.newRequest.$valid) {
      $scope.request.$save();
      $scope.requests.push($scope.request);
      $scope.request = new Request();
    }
  };

  $scope.remove = function(request){
    if(request.user_token == $cookies.user_token) {
      request.$delete(function(){
        $scope.requests.splice( $scope.requests.indexOf(request), 1 );
      });
    }
  };
};
