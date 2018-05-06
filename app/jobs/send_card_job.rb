class SendCardJob < ApplicationJob
  queue_as :default

  def perform(registration:)
    template = ApplicationController.render 'registrations/show', assigns: { registration: registration }, layout: 'pdf'
    pdf = WickedPdf.new.pdf_from_string template
    ApplicationMailer.send_card(registration: registration, pdf: pdf).deliver_now
  end
end
