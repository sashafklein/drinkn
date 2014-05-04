#= require jquery
#= require jquery_ujs
#= require ahoy
#= require turbolinks
#= require angular.min
#= require angular-resource.min
#= require ng_app

$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])