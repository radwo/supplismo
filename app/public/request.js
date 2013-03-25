angular.module('requestService', ['ngResource']).
  factory('Request', function ($resource) {
    return $resource("/requests/:id", {id: "@id"} );
  });
