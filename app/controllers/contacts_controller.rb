class ContactsController < ApplicationController
  before_action :find_contact, only: %i[edit update show destroy]
  before_action :find_multiple_contacts, only: %i[activate deactivate]

  # CSRF token authenticity error using htmx-delete
  protect_from_forgery except: [:destoy]

  layout false

  def index
    @contacts = Contact.page(params[:page])
  end

  def show; end

  def edit; end

  def update
    @contact.update(contact_params)

    redirect_back fallback_location: root_path
  end

  def destroy
    @contact.destroy

    head :ok
  end

  def activate
    update_status(status: true)

    render_contact_row
  end

  def deactivate
    update_status(status: false)

    render_contact_row
  end

  private

  def index_params
    params.require(:page)
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :active)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def find_multiple_contacts
    @contacts = Contact.where(id: params[:ids])
  end

  def update_status(status:)
    Contact.where(id: params[:ids]).update(active: status)
  end

  def render_contact_row
    render(
      template: false,
      partial: 'contacts/contact_row',
      collection: Contact.all,
      as: :contact,
      locals: {
        include_checkbox: true,
        changed_contacts: changed_contacts
      }
    )
  end

  # Pass changed contacts to partial to be able to change tr class and show transitions.
  def changed_contacts
    params[:ids].each_with_object({}) do |id, obj|
      obj[id.to_i] = action_name
    end
  end
end
