# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
def create_concerts(total)
	concerts = []
	total.times do |n|
		concerts << Concert.new(band: "band#{n+1}", 
								venue: "venue#{n+1}", 
								city: "city#{n+1}", 
								date: n + 1, 
								price: rand(100), 
								description: "#{n+1} Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
	end
	concerts
end

def create_future_concerts(total)
	create_concerts(total).each do |concert|
		concert.date = concert.date.weeks.from_now
		concert.save
		create_comments(2, concert)
	end
end

def create_passed_concerts(total)
	create_concerts(total).each do |concert|
		concert.date = concert.date.weeks.ago
		concert.save
		create_comments(2, concert)
	end
end

def create_todays_concerts(total)
	create_concerts(total).each do |concert|
		concert.band = "today band#{concert.date}"
		concert.date = Date.today
		concert.save
		create_comments(2, concert)
	end
end

def create_comments(total, concert)
	total.times do |n|
		concert.comments.create(user: "autor#{n}", content: "#{n}Sed ut perspiciatis unde omnis iste natus error sit")
	end
end

create_todays_concerts(3)
create_future_concerts(10)
create_passed_concerts(10)