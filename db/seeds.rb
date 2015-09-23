# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

List.create(name:"Chinese Cusine", location:"Chinatown")
Clue.create(list_id: 2,latitude: 40.7159716,longitude:-73.9971711, text: "With more than 1,300 reviews this restaurant has the best Dim Sum", answer:"Jing Fong Restaurant")
Clue.create(list_id: 2, latitude: 40.714655,longitude:-73.9977528, text: "Shanghai best soup dumplings have been brought by (rhythmes with toe)", answer:"Joe’s Shanghai")
Clue.create(list_id: 2, latitude:40.7162159,longitude:-73.9983124, text: "Best Roast Pork in Mott st", answer:"Big Wong King")
Clue.create(list_id: 2, latitude:40.7165432,longitude:-73.999068, text: "Sweet Egg Tarts' Bakery", answer:"Lung Moon Bakery")
Clue.create(list_id: 2, latitude:40.7165432,longitude:-73.999068, text: "First Bubble Tea in Chinatown", answer:"Ten Ren’s Tea Time")
