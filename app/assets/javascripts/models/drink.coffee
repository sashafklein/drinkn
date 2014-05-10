angular.module('Models').factory 'Drink', (BaseModel, $http) ->

  class Drink extends BaseModel

    constructor: (_properties) ->
      properties = _(_properties).clone()
      _.extend(this, properties)

    getDrinkIngredients: -> return $http.get("/api/v1/drinks/#{@id}/drink_ingredients")
    
    add: (ingredient, measure, number) -> 
      return $http.post("/api/v1/drinks/#{@id}/add", { ingredient_id: ingredient.id, measure: measure, number: number })
    
    remove: (ingredient) ->
      return $http.post("/api/v1/drinks/#{@id}/remove", { ingredient_id: ingredient.id} )
    
    @generateFromJSON: (json) -> BaseModel.generateFromJSON(Drink, json)

  return Drink

