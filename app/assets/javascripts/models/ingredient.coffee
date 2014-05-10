angular.module('Models').factory 'Ingredient', (BaseModel, $http) ->

  class Ingredient extends BaseModel

    constructor: (_properties) ->
      properties = _(_properties).clone()
      _.extend(this, properties)

    @availableMeasures: ['oz', 'dash', 'peel', 'drop']

    @generateFromJSON: (json) -> BaseModel.generateFromJSON(Ingredient, json)

  return Ingredient
