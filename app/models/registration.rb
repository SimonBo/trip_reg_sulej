class Registration < ApplicationRecord
  PLACES = [
   "Szkoła Podstawowa nr 3 im. Marszałka Józefa Piłsudskiego 05-071 Sulejówek ul. Głowackiego 47",
   "Szkoła Podstawowa nr 1 im. Pierwszego Marszałka Polski Józefa Piłsudskiego 05-070 Sulejówek ul. Idzikowskiego 2a"
   ]

  RETURN_HOME = [
    'uczestnik samodzielnie wraca do domu',
    'uczestnik będzie odbierany przez (proszę wpisać imię i nazwisko oraz numer telefonu kontaktowego osoby):'
   ]

  validates :place,
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
            :pesel,
            :return_home_guardian,
            :email,
            :phone_number,
            :parents_address,
            presence: { message: "pole jest obowiązkowe" }
   validates :pesel, pesel: true
end
