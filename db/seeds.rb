# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all

response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
list = JSON.parse(response) # JSON parse
ingredients = list["drinks"] # On obtient un array de 160 elements
puts 'Creating restaurants...'
ingredients.each do |i|
  i.each do |key, value|
  Ingredient.create!(name: value)
  end
end

puts 'Finished!'
