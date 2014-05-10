angular.module('Models').factory 'DrinkIngredient', (BaseModel) ->

  class DrinkIngredient extends BaseModel

    constructor: (_properties) ->
      properties = _(_properties).clone()
      @ingredient = @extractHasOneRelation(Ingredient, properties, 'ingredient')
      _.extend(this, properties)

    editMode: false

    toggleMode: -> @editMode = !@editMode
    toggleText: -> if @editMode then 'Save' else 'Edit'

    @generateFromJSON: (json) -> BaseModel.generateFromJSON(DrinkIngredient, json)

  return DrinkIngredient
