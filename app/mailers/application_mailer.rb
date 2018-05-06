class ApplicationMailer < ActionMailer::Base
  default from: 'arosa@umsulejowek.pl'
  layout false

  def send_card(registration:, pdf:)
    registration = registration
    attachments['zgłoszenie.pdf'] = pdf
    mail to: registration.email,
         subject: "Lato w mieście Sulejówek 2018"
  end
end
