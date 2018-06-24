# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Cocktail.destroy_all
Cocktail.create!(name: "Mint Mojito", description: "6 Mint Leaves, 1oz lime juice, 2 teaspoon Sugar, 1 1/2oz White Rum, Soda Water")
Cocktail.create!(name: "Margarita", description: "1oz Cointreau, 2oz Tequila, 1oz Lime Juice")
Cocktail.create!(name: "White Russian", description: "1 2/3oz Vodka, 2/3oz Coffee Liqeur, 1oz Fresh Cream")
Cocktail.create!(name: "Gin & Tonic", description: "2oz Gin, 3oz Tonic Water, 1 Lime wedge")
Cocktail.create!(name: "Aperol Spritz", description: "2oz Prosecco, 1 1/4oz Aperol, Splash of Soda Water")


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient = open(url).read
json_ingredient = JSON.parse(ingredient)

json_ingredient["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end




# doses= ["30ml Rum", "30ml Vodka", "30ml Whiskey", "30ml Tequila"]

# doses.each do |dose|
#   Dose.create(description: dose)
# end
