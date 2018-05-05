class ApplicationMailer < ActionMailer::Base
  default from: 'arosa@umsulejowek.pl'
  layout false

  def send_card(registration:)
    @registration = registration
    mail to: @registration.email,
         subject: "Lato w mieście Sulejówek 2018"
  end
end
