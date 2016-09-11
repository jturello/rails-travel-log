class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      flash[:notice] = "Country successfully added!"
      redirect_to countries_path
    else
      flash[:alert] = "Country not added. Try again!"
      render :new
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      flash[:notice] = "Country updated successfully!"
      redirect_to country_path(@country)
    else
      flash[:alert] = "Country not saved. Try again!"
      render :edit
    end
  end

  private
  def country_params
    params.require(:country).permit(:name, :blurb, :description, :language, :image_url)
  end
end
