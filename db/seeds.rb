manhattan = Drink.create({
  name: 'Manhattan',
  description: 'A classy drink',
  instructions: 'Mix and garnish with bitters and orange peel.'
  })

vermouth = Ingredient.create({
  name: "Vermouth",
  description: 'An italian herbal fortified wine'
  })

bourbon = Ingredient.create({
  name: 'Bourbon',
  description: 'Whiskey distilled from corn in America'
  })

angostura = Ingredient.create({
  name: 'Angostura Bitters',
  description: 'A potent mix of spices and high-proof alcohol'
  })

orange_peel = Ingredient.create({
  name: 'Orange Peel',
  description: 'The rind of an orange, usually bitter.'
  })

cherry = Ingredient.create({ 
  name: 'Maraschino Cherry', 
  description: 'A nasty nasty thing'
  })

manhattan.add(vermouth, 'oz', 3/4.0)
manhattan.add(bourbon, 'oz', 2.5)
manhattan.add(angostura, 'dash', 1)
manhattan.add(orange_peel, 'garnish', 1)
manhattan.add(cheery, 'garnish', 1)