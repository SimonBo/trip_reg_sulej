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
      :place,
      :days,
      :day_from,
      :day_to,
      :return_home,
      :full_name,
      :birth_year,
      :address,
      :school_name,
      :group_name,
      :parents_names,
      :special_needs,
      :health_status,
      :tezec,
      :blonnica,
      :dur,
      :vaccine_other,
      :pesel,
      :return_home_guardian
      )
  end
end
