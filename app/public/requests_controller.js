function RequestsCtrl($scope, Request, $resource) {
  $scope.requests = Request.query();
  $scope.predicate = 'id';
  $scope.reverse   = true;
  $scope.request = new Request();

  $scope.addRequest = function(){


    if($scope.newRequest.$valid) {
      $scope.request.$save({text: $scope.request.text}, function(){
        $scope.requests.push($scope.request);
      });
      $scope.request.text = '';
    }
  };
};
