class Registration < ApplicationRecord
  PLACES = [
   "Szkoła Podstawowa nr 1 im. Pierwszego Marszałka Polski Józefa Piłsudskiego, 05-070 Sulejówek ul. Idzikowskiego 2a",
   "Szkoła Podstawowa nr 4 im. Janusza Korczaka, 05-071 Sulejówek ul. Narutowicza 10"
   ]

  RETURN_HOME = [
    'uczestnik samodzielnie wraca do domu',
    'uczestnik będzie odbierany przez (proszę wpisać imię i nazwisko oraz numer telefonu kontaktowego osoby):'
   ]

  validates :place,
            :return_home,
            :full_name,
            :birth_year,
            :address,
            :school_name,
            :group_name,
            :parents_names,
            :pesel,
            :email,
            :phone_number,
            :parents_address,
            presence: { message: "pole jest obowiązkowe" }
   validates :pesel, pesel: { message: 'nie jest prawidłowym numerem PESEL' }
   validate :days_or_days_from_to_present
   validate :return_home_guardian_present
   validates :email, email: true

   def input_or_value(field:, f:, for_pdf:, as: :text)
    if for_pdf
      self.send field
    else
      f.input field, wrapper: false, label: false, error: false, as: as
    end
   end

   private

   def days_or_days_from_to_present
     if days.blank? && day_from.blank?
      errors.add(:days)
      errors.add(:day_from)
      errors.add(:day_to)
     end
   end

   def return_home_guardian_present
     if return_home == RETURN_HOME.last && return_home_guardian.blank?
      errors.add(:return_home_guardian)
     end
   end
end
