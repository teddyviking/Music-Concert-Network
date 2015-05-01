class Concert < ActiveRecord::Base
	validates_presence_of :band, :venue, :city, :description
	validates :date, date: {message: "Date format not valid"}
	validates :price, numericality: true, presence: true


	def self.find_today_concerts
		today_concerts = Concert.where date: Date.today
	end

	def self.find_later_month_concerts
		concerts = Concert.where date: ((Date.today + 1)..(Date.today.end_of_month))
	end
end