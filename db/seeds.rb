# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }, {name: 'Madrid'}, {name: 'Barcelona'}, {name: 'Tokyo'}])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
def create_concerts(total)
	concerts = []
	total.times do |n|
		concerts << Concert.new(band: "band#{n+1}", 
								venue: "venue#{n+1}", 
								date: n + 1, 
								price: rand(100), 
								description: "#{n+1} Sed ut perspiciatis unde omnis iste natus error sit 
								voluptatem accusantium doloremque")
	end
	concerts
end

def create_future_concerts(total)
	create_concerts(total).each do |concert|
		concert.date = concert.date.weeks.from_now
		add_random_city_to_concert(concert)
		concert.save
		create_comments(rand(5), concert)
	end
end

def create_passed_concerts(total)
	create_concerts(total).each do |concert|
		concert.date = concert.date.weeks.ago
		add_random_city_to_concert(concert)
		concert.save
		create_comments(rand(5), concert)
	end
end

def create_todays_concerts(total)
	create_concerts(total).each do |concert|
		concert.band = "today band#{concert.date}"
		add_random_city_to_concert(concert)
		concert.date = Date.today
		concert.save
		create_comments(rand(5), concert)
	end
end

def add_random_city_to_concert(concert)
	concert.city = City.find(rand(1..City.all.count))
end

def create_comments(total, concert)
	total.times do |n|
		concert.comments.create(user: "user#{n}", content: "#{n}Sed ut perspiciatis unde omnis iste natus error sit")
	end
end

create_todays_concerts(3)
create_future_concerts(20)
create_passed_concerts(10)