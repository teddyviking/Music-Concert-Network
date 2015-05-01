class Comment < ActiveRecord::Base
	validates_presence_of :user, :content
	belongs_to :concert
end
