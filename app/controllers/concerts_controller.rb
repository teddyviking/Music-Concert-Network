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
    if @concert.save
      flash.now[:notice] = "Concert successfuly created"
      redirect_to concert_path(@concert)
    else
      flash.now[:alert] = "There are some errors in your concert"
      render 'new'
    end
  end

  def edit
    @concert = Concert.find params[:id]
  end

  def update
    @concert = Concert.find params[:id]
    if @concert.update_attributes permited_params
      flash.now[:notice] = "Concert successfuly updated"
      redirect_to concert_path(@concert)
    else
      flash.now[:alert] = "Concert could not be updated"
      render 'edit'
    end  	
  end

  def destroy
    @concert = Concert.find params[:id]
  	@concert.destroy
    flash.now[:notice] = "Concert successfuly destroyed"
    redirect_to root_path
  end

  def display_today
    @today_concerts = Concert.find_today_concerts
    @later_concerts = Concert.find_later_month_concerts
  end


  private

  def permited_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
  end
  
end
