class ConcertsController < ApplicationController
  def index
  	@concerts = Concert.all
  end

  def show
    @concert = Concert.find params[:id]
  end

  def new
  end

  def create
  	
  end

  def edit
  end

  def update
  	
  end

  def destroy
  	
  end

  
end
