class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:shelter_id])
  end

  def new
  end

  def create
    shelter = Shelter.new(shelter_params)
    if shelter.save
      flash[:success] = "#{shelter.name} Was Successfully Created!"
      redirect_to '/shelters'
    else
      flash[:error] = shelter.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
