# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
def create_concerts(total)
	total.times do |n|
		Concert.create(band: "band#{n}", 
			venue: "venue#{n}", 
			city: "city#{n}", 
			date: n.weeks.from_now, 
			price: rand(100), 
			description: "Description #{n}")
	end
end

create_concerts(10)