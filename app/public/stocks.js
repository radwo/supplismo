angular.module('stockService', ['ngResource']).
  factory('Stock', function ($resource) {
    return $resource("/stocks/:id", {id: "@id"}, {update: {method: "PUT"}});
  });
