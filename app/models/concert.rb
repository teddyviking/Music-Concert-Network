class Concert < ActiveRecord::Base
	has_many :comments
	belongs_to :city
	
	validates_presence_of :band, :venue, :description
	validates :date, date: {message: "Date format not valid"}
	validates :price, numericality: true, presence: true


	def self.find_today_concerts
		today_concerts = self.where date: Date.today
	end

	def self.find_later_month_concerts
		concerts = self.where date: ((Date.today + 1)..(Date.today.end_of_month))
	end

	def self.find_future_events
		self.where("date >= ?", Date.today)
	end

	def self.find_future_events_with_budget(budget)
		self.find_future_events.where("price <= ?", budget)
	end

	def self.find_future_events_with_most_comments
 		self.order('comments_count DESC').limit(10)	
 	end
end