# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Ingredient.destroy_all
Cocktail.destroy_all
Cocktail.create!(name: "Mint Mojito")
Cocktail.create!(name: "Margarita")


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient = open(url).read
json_ingredient = JSON.parse(ingredient)

json_ingredient["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end




doses= ["30ml Rum", "30ml Vodka", "30ml Whiskey", "30ml Tequila"]

doses.each do |dose|
  Dose.create(description: dose)
end
