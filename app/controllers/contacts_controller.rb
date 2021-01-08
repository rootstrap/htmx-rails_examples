class ContactsController < ApplicationController
  before_action :find_contact, only: %i[edit update show destory]
  before_action :find_multiple_contacts, only: %i[activate deactivate]

  def index
    @contacts = Contact.all
  end

  def show; end

  def edit; end

  def update
    @contact.update(contact_params)

    redirect_back fallback_location: root_path
  end

  def activate
    @contacts.update(active: true)

    render(
      template: false,
      partial: 'contacts/contact_row',
      collection: @contacts,
      as: :contact,
      locals: { include_checkbox: true }
    )
  end

  def deactivate
    @contacts.update(active: false)

    render(
      template: false,
      partial: 'contacts/contact_row',
      collection: @contacts,
      as: :contact,
      locals: { include_checkbox: true }
    )
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :active)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def find_multiple_contacts
    @contacts = Contact.where(id: params[:ids])
  end
end
