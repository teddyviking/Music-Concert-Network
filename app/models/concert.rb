class Concert < ActiveRecord::Base
	has_many :comments
	
	validates_presence_of :band, :venue, :city, :description
	validates :date, date: {message: "Date format not valid"}
	validates :price, numericality: true, presence: true


	def self.find_today_concerts
		today_concerts = self.where date: Date.today
	end

	def self.find_later_month_concerts
		concerts = self.where date: ((Date.today + 1)..(Date.today.end_of_month))
	end

	def self.find_future_events_with_budget(budget)
		self.where("price <= ?", budget).where("date >= ?", Date.today)
	end
end