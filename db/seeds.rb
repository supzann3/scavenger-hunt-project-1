# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

List.create(name:"Test List", location:"FIS")
Clue.create(list_id: 1, text: "Who was the first president of the US?", answer:"George Washington")
Clue.create(list_id: 1, text: "What is 19 - 5", answer:"14")
Clue.create(list_id: 1, text: "What is is the biggest state in the United States by size?", answer:"Alaska")
