angular.module('Models').factory('Drink', (BaseModel, $http) ->

  class Drink extends BaseModel

    constructor: (_properties) ->
      properties = _(_properties).clone()
      _.extend(this, properties)

    getDrinkIngredients: -> return $http.get("/api/v1/drinks/#{@id}/drink_ingredients")

    @generateFromJSON: (json) -> BaseModel.generateFromJSON(Drink, json)

  return Drink
)
