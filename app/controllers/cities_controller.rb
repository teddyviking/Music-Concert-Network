class CitiesController < ApplicationController
  def index
  	@cities = City.all
  end

  def show
  	@city = City.find params[:id]
  end

  def new
  	@city = City.new
  end

  def create
  	@city = City.new permited_params
  	if @city.save
  		redirect_to city_path(@city)
  	else
  		render 'new'
  	end
  end
 

  def edit


  end

  def update
  	
  end

  private

  def permited_params
  	params.require(:city).permit(:name)
  end
end
