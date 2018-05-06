class RegistrationsController < ApplicationController
  def index
    redirect_to new_registration_path
  end

  def new
    @registration = Registration.new(
      place: Registration::PLACES.first,
      return_home: Registration::RETURN_HOME.first
      )
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      SendCardJob.perform_later(registration: @registration)
      redirect_to thanks_path
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
