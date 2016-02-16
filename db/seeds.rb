# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_names = %w(Anne Bob Camille Denis Emilie Felix Gustave Henri Irina James)
cities = %w(Paris Lyon Bordeau Rennes Nantes Paris Lyon Bordeau Rennes Nantes)
password = "12345678"
kitten_name = %w(Lechat Thecat Daskat Tichat Kitty)
races = %w(A B C D E)


(0..9).each do |i|
  user = User.new(name: user_names[i], address: cities[i], email: "#{user_names[i]}@gmail.com", password: password)
  user.save
end

(0..4).each do |i|
  kitten = Kitten.new(name: kitten_name[i], race: races[i], owner: User.find(i+1))
  kitten.save
end

(0..4).each do |i|
  booking = Booking.new(kitten: Kitten.find(i + 1), renter: User.find(i + 5), start_date: 20160101, end_date: 20160201)
  booking.save
end
