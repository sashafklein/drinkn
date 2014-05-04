#= require_self
#= require underscore-min
#= require ui-bootstrap-tpls.min
#= require common/common
#= require_tree ./models

# http://clintberry.com/2013/modular-angularjs-application-design/

angular.module('Common', [])
angular.module('Models', [])

@ngApp = angular.module("ngApp", [
  "Models"
]).config ($compileProvider) ->
  # Prevent angular from marking links with a variety of protocols "unsafe"
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|webcal|mailto|file|tel):/)
