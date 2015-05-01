class Concert < ActiveRecord::Base
	validates :band, presence: true
	validates :venue, presence: true
	validates :city, presence: true
	validates :date, date: {message: "Date format not valid"}
	validates :price, numericality: true, presence: true
	validates :description, presence: true
end