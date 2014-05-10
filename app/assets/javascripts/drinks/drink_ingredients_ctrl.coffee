angular.module("Drinks").controller 'DrinkIngredientsCtrl', ($scope, DrinkIngredient, Drink, Ingredient, $q, $filter) ->

  $s = $scope

  $s.init = ->
    $q.all([ $s._fetchDrink() ])
      .then( $s._fetchIngredients )
      .then( $s._fetchAvailableIngredients )
      .then( $s._fetchAvailableMeasures )

  $s.addIngredient = ->
    return unless $s.newIngredientSpecified()
    $s.drink.add($s.newIngredient, $s.newIngredient.measure, $s.newIngredient.number)
      .success (response) ->
        $s._setDrinkIngredients(response)
        $s.resetNewIngredient()
      .error (response) -> console.log response

  $s.remove = (drinkIngredient) ->
    $s.drink.remove(drinkIngredient.ingredient)
      .success (response) ->
        $s._setDrinkIngredients(response)
      .error (response) -> console.log response

  $s.newIngredientSpecified = -> $s.newIngredient? && $s.newIngredient.measure? && $s.newIngredient.number?

  $s.resetNewIngredient = -> 
    $s.newIngredient = null
    $s.newIngredientMeasure = null 
    $s.newIngredientNumber = null

  $s.proposeNewIngredient = (ingredient) ->
    $s.newIngredient = ingredient

  $s.availableIngredients = -> _($s.allAvailable).reject (ingredient) -> 
    _.contains($s._preexistingIngredientNames(), ingredient.name)

  #########
  # PRIVATE
  #########

  $s.logQuery = -> 
    console.log $s.ingredientQuery
    console.log $s.availableIngredients()
  $s._fetchDrink = ->
    drinkId = location.pathname.split('/')[2]
    $s.drink = new Drink({id: drinkId})

  $s._fetchIngredients = ->
    $s.drink.getDrinkIngredients()
      .success (response) ->
        $s._setDrinkIngredients(response)
      .error (response) -> 
        console.log(response)

  $s._fetchAvailableIngredients = ->
    Ingredient.getAll()
      .success (response) ->
        $s.allAvailable = Ingredient.generateFromJSON(response)

  $s._preexistingIngredientNames = ->
    _($s.drinkIngredients).map (di) -> di.name

  $s._setDrinkIngredients = (data) ->
    $s.drinkIngredients = DrinkIngredient.generateFromJSON(data)

  $s._fetchAvailableMeasures = ->
    $s.availableMeasures = Ingredient.availableMeasures