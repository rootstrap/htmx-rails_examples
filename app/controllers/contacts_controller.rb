class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :show, :destory]

  def index
    @contacts = Contact.all
  end

  def show; end

  def edit; end

  def update
    @contact.update(contact_params)

    redirect_back fallback_location: root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :active)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
