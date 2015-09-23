# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

List.create(name: "Park Slope Pub Crawl", location: "Brooklyn, NY")
List.create(name: "Chinese Cusine", location: "Chinatown")
List.create(name: "Museums", location: "NYC")
List.create(name: "Historical Landmarks", location: "NYC")

Clue.create(list_id: 1,
  text: "This bar on located on 9th Street between Fourth and Fifth avenue is a real 'Hoot'.  Ask one of the friendly bartenders to help you choose a beer from their terrific rotating selection.",
  answer:"The Owl Farm",
  latitude: 40.6695782,
  longitude: -73.9866109)

Clue.create(list_id: 1,
  text: "To make this cocktail, shake 5 parts cognac, 2 parts Grand Marnier, and 2 parts lemon juice and strain into a chilled glass, or just go to the amazing bar named after it on 5th Avenue between 15th Street and 16th Street.",
  answer:"Sidecar",
  latitude: 40.6653849,
  longitude: -73.9897924)

Clue.create(list_id: 1,
  text: "If the idea of 'political community founded for the common good' is appealing to you, you might like this no frills pub with a back yard located right on the corner of 5th Avenue and 12th Street.",
  answer:"Commonwealth",
  latitude: 40.6671918,
  longitude: -73.9876922)

Clue.create(list_id: 1,
  text: "No, you don't have to be an architect to enjoy the cocktails at this swanky establishment on 5th Avenue between Union Street and Berkeley Street.",
  answer:"Blueprint",
  latitude: 40.6768664,
  longitude: -73.980343)

Clue.create(list_id: 1,
  text: "Go to this relaxed pub on 4th Avenue between Bergen Street and St. Marks Street to play some board games or darts or to lounge on the comfy couches.  Just make sure you don't show up three hours late because of the time change.",
  answer:"Pacific Standard",
  latitude: 40.6821078,
  longitude: -73.9801492)

Clue.create(list_id: 1,
           text: "Head a few doors down for some free popcorn (it's best sprinkled with the Old Bay seasoning!)  If you are there on the last day of school before a break from school, you may run into some excited teachers.  Congratulate them by writing on the chalkboard walls in the bathroom. It's on 4th Avenue.  That's your clue about the name.",
           answer:"4th Avenue Pub",
           latitude: 40.682248,
           longitude: -73.980002)

Clue.create(list_id: 2,latitude: 40.7159716,longitude:-73.9971711, text: "With more than 1,300 reviews this restaurant has the best Dim Sum", answer:"Jing Fong Restaurant")
Clue.create(list_id: 2, latitude: 40.714655,longitude:-73.9977528, text: "Shanghai best soup dumplings have been brought by (rhythmes with toe)", answer:"Joe’s Shanghai")
Clue.create(list_id: 2, latitude:40.7162159,longitude:-73.9983124, text: "Best Roast Pork in Mott st", answer:"Big Wong King")
Clue.create(list_id: 2, latitude:40.7165432,longitude:-73.999068, text: "Sweet Egg Tarts' Bakery", answer:"Lung Moon Bakery")
Clue.create(list_id: 2, latitude:40.7165432,longitude:-73.999068, text: "First Bubble Tea in Chinatown", answer:"Ten Ren’s Tea Time")


Clue.create(
  list_id: 3,
  text: "Located on the Upper West Side this is one of the largest museums in the world, and comprises 27 interconnected buildings, in addition to a planetarium and a library.",
  answer:"American Museum of Natural History",
  latitude: 40.782032,
  longitude: -73.9717188)

Clue.create(
  list_id: 3,
  text: "This museum, located in Midtown, was established in 1929 and contains nearly 200,000 works from around the world spanning the last 150 years.",
  answer:"Museum of Modern Art",
  latitude: 40.761417,
  longitude: -73.9771203)

Clue.create(
  list_id: 3,
  text: "This museum the largest art museum in the United States and among the most visited art museums in the world.",
  answer:"Metropolitan Museum of Art",
  latitude: 40.7791655,
  longitude: -73.9629278)

Clue.create(
  list_id: 3,
  text: "This museum and gardens, located in Fort Tryon Park, is devoted to the art and architecture of medieval Europe.",
  answer:"The Cloisters",
  latitude: 40.8649437,
  longitude: -73.931655)

Clue.create(
  list_id: 3,
  text: "This museum, located on 5th Avenue, is known for its impressive architecture, arguably Frank Lloyd Wright's most important building of his late career.",
  answer:"Solomon R. Guggenheim Museum",
  latitude: 40.7830178,
  longitude: -73.9588884)

Clue.create(
  list_id: 4,
  text: "What plants grow in the center of Bowling Green Park?",
  answer: "flowers",
  latitude: 40.704926,
  longitude: -74.0136705)

Clue.create(
  list_id: 4,
  text: "What church has one of the oldest graveyards in America?",
  answer: "Trinity church",
  latitude: 40.707633,
  longitude: -74.0126206)

Clue.create(
  list_id: 4,
  text: "What is the building that now stands at the spot where George Washington was inaugurated?",
  answer: "Federal Hall National Monument",
  latitude: 40.7073993,
  longitude: -74.0102088)

Clue.create(list_id: 4,
  text: "What is the world’s largest stock exchange?",
  answer: "New York Stock Exchange",
  latitude: 40.7068014,
  longitude: -74.0118012)

Clue.create(
  list_id: 4,
  text: "Big bank, built like a fortress, in Fidi?",
  answer: "Federal Reserve",
  latitude: 40.7085064,
  longitude: -74.0087231)
