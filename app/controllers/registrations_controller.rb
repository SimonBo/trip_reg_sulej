class RegistrationsController < ApplicationController
  def index

  end

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      redirect_to registrations_path
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(
      Registration.attribute_names
      )
  end
end
