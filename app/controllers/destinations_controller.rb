class DestinationsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  helper_method :sort_column, :sort_direction

  def show
    @destination = Destination.find(params[:id])
    @posts = @destination.posts.joins(:user).order(sort_column + " " + sort_direction)
    # binding.pry
  end

  def new
    @country = Country.find(params[:country_id])
    @destination = @country.destinations.new
  end

  def create
    @country = Country.find(params[:country_id])
    @destination = @country.destinations.new(destination_params)

    if @destination.save
      flash[:notice] = "Destination successfully added!"
      redirect_to country_path @destination.country
    else
      flash[:alert] = "Destination not added. Try again!"
      redirect_to new_country_destination_path @destination.country, @destination
    end
  end

  def edit
    @destination = Destination.find(params[:id])
    @country = Country.find(@destination.country.id)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      flash[:notice] = "Destination updated successfully!"
      redirect_to country_destination_path @destination.country, @destination
    else
      flash[:alert] = "Destination not saved. Try again!"
      render :edit
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    flash[:notice] = "Destination deleted successfully!"
    redirect_to country_path(@destination.country)
  end

  private
  def destination_params
    params.require(:destination).permit(:name, :blurb, :description, :image_url)
  end

  def sort_column
    %w[username updated_at content].include?(params[:sort]) ? params[:sort] : 'updated_at'
  end

  def sort_direction
    # params[:direction] ||= 'asc'
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
