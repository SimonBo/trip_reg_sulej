ActiveAdmin.register Registration do
  permit_params Registration.attribute_names

  action_item only: :show do
    link_to 'PDF', [:pdf, :admin, resource]
  end

  member_action :pdf do
    template = ApplicationController.render 'registrations/show', assigns: { registration: resource }, layout: 'pdf'
    pdf = WickedPdf.new.pdf_from_string template
    send_data pdf, type: "application/pdf", disposition: "inline"
  end

  action_item only: :show do
    link_to 'Wyślij email ponownie', [:resend, :admin, resource]
  end

  member_action :resend do
    SendCardJob.perform_later(registration: resource)
    redirect_to admin_registrations_path, notice: 'Email zostanie wkrótce wyslany.'
  end
end
