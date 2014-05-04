angular.module("Common").directive "clickAnywhereButHere", ($document) ->
  restrict: "A"
  link: (scope, elem, attr, ctrl) ->
    clickHandler = (event) ->
      scope.$apply ->
        if !($(event.target).is($(elem))) && elem.find(event.target).length == 0
          scope.$eval(attr.clickAnywhereButHere)
          $document.unbind('click.clickAnywhereButHere')

    applyBindings = ->
      $document.bind('click.clickAnywhereButHere', clickHandler)

    if attr.active
      scope.$watch(attr.active, (active) ->
        if active
          applyBindings()
      )
    else
      elem.on('click', ->
        scope.$apply($document.bind('click.clickAnywhereButHere', clickHandler))
      )

