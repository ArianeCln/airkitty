# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_names = %w(Anne Bob Camille Denis Emilie Felix Gustave Henri Irina James)
address = [
  "12 rue Oberkampf",
  "15 boulevard Richard Lenoir",
  "9 rue des Martyrs",
  "11 rue de Tolbiac",
  "5 rue des Boulets",
  "3 rue Cadet",
  "10 rue Lamartine",
  "13 rue de l'Assomption",
  "2 avenue des Gobelin",
  "8 rue Tronchet",
  "40 boulevard Malesherbes"
]
cities = %w(Paris Lyon Bordeau Rennes Nantes Paris Lyon Bordeau Rennes Nantes)
password = "12345678"
menus = %w(gastro croquette)
personalities = ["aggressif", "gentil", "calme", "fougeux", "sauvage", "flemmard", "tendre", "respectueux", "énergique", "flegmatique"]
kitten_name = %w(Lechat Thecat Daskat Tichat Kitty)
races = %w(A B C D E)


(0..9).each do |i|
  user = User.new(name: user_names[i], address: cities[i], email: "#{user_names[i]}@gmail.com", password: password)
  user.save
end

(0..4).each do |i|
  kitten = Kitten.new(name: kitten_name[i], race: races[i], owner: User.find(i+1), diet: menus.sample, personality: personalities.sample, home_delivery: [true, false].sample)
  kitten.save
end

(0..4).each do |i|
  booking = Booking.new(kitten: Kitten.find(i + 1), renter: User.find(i + 5), start_date: 20160101, end_date: 20160201)
  booking.save
end

