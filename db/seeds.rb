require 'faker'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

###########################
# SEED INGREDIENTS
###########################
puts "deleting old ingredients..."
Ingredient.destroy_all

puts "creating new ingredients..."

# get ingredients json
doc = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
# get ingredients array from cocktail db
ingredients = JSON.parse(doc)["drinks"].map! { |i| i["strIngredient1"]}

ingredients.each do |i|
  Ingredient.create({ name: i })
end

puts "done!"
