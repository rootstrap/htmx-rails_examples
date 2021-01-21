class ExamplesController < ApplicationController
  before_action :set_contacts, only: [:bulk_update, :delete_row]

  def index; end

  def click_to_edit
    @contact = Contact.first
  end

  def bulk_update; end

  def delete_row; end

  private

  def set_contacts
    @contacts = Contact.all
  end

  def click_to_load
    @contacts = Contact.page(1)
  end
end
