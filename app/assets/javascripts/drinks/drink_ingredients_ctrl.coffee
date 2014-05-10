angular.module("Drinks").controller 'DrinkIngredientsCtrl', ($scope, DrinkIngredient, Drink, Ingredient, $q, $filter) ->

  $s = $scope

  $s.init = ->
    $q.all([ $s._fetchDrink() ])
      .then( $s._fetchIngredients )
      .then( $s._fetchAvailableIngredients )
      .then( $s._fetchAvailableMeasures )

  $s.filteredAvailableIngredients = ->
    filter = $filter('filter')
    filter $s._availableIngredients, 
      name: $s.ingredientQuery

  $s.addIngredient = ->
    return unless $s.newIngredientSpecified()
    $s.drink.add($s.newIngredient, $s.newIngredientMeasure, $s.newIngredientNumber)
      .success (response) ->
        $s._setDrinkIngredients(response)
        $s.resetNewIngredient()
      .error (response) -> console.log response

  $s.remove = (drinkIngredient) ->
    $s.drink.remove(drinkIngredient.ingredient)
      .success (response) ->
        $s._setDrinkIngredients(response)
      .error (response) -> console.log response

  $s.newIngredientSpecified = -> $s.newIngredient? && $s.newIngredientMeasure? && $s.newIngredientNumber?

  $s.resetNewIngredient = -> 
    $s.newIngredient = null
    $s.newIngredientMeasure = null 
    $s.newIngredientNumber = null

  $s.proposeNewIngredient = (ingredient) ->
    $s.newIngredient = ingredient

  #########
  # PRIVATE
  #########

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
        rawList = Ingredient.generateFromJSON(response.ingredients)
        $s._availableIngredients = _(rawList).where (ingredient) ->
          !_($s.drinkIngredients).find (di) -> di.ingredient == ingredient

  $s._setDrinkIngredients = (data) ->
    $s.drinkIngredients = DrinkIngredient.generateFromJSON(data.drink_ingredients)
    window.ing = $s.drinkIngredients

  $s._fetchAvailableMeasures = ->
    $s.availableMeasures = Ingredient.availableMeasures