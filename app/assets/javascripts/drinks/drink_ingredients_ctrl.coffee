angular.module("Drinks").controller 'DrinkIngredientsCtrl', ($scope, DrinkIngredient, Drink) ->

  $s = $scope

  $s.fetchIngredients = ->
    drinkId = location.pathname.split('/')[2]
    $s.drink = new Drink({id: drinkId})

    $s.drink.getDrinkIngredients()
      .success (response) ->
        $s.ingredients = DrinkIngredient.generateFromJSON(response.drinks)
      .error (response) -> console.log(response)