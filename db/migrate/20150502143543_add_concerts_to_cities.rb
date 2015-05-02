class AddConcertsToCities < ActiveRecord::Migration
  def change
  	change_table :concerts do |t|
  		t.remove :city
  		t.belongs_to :city, index: true
  	end
  end
end
