class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    @pets = Pet.where(user: current_user)
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_strong_params)
    @pet.user = current_user
    @pet.save
    redirect_to pets_path
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pets_path
  end

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
  end


  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_strong_params
    params.require(:pet).permit(:name, :species, :price_per_day, :age, :category)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
