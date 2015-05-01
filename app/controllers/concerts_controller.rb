class ConcertsController < ApplicationController
  def index
  	@concerts = Concert.all
  end

  def show
    @concert = Concert.find params[:id]
  end

  def new
    @concert = Concert.new
  end

  def create
  	@concert = Concert.new permited_params
    binding.pry
    if @concert.save
      flash.now[:notice] = "Concert successfuly created"
      redirect_to concert_path(@concert)
    else
      flash.now[:alert] = "There are some errors in your concert"
      render 'new'
    end
  end

  def edit
  end

  def update
  	
  end

  def destroy
  	
  end

  private

  def permited_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
  end
  
end
