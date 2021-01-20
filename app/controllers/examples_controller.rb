class ExamplesController < ApplicationController
  def index; end

  def click_to_edit
    @contact = Contact.first
  end

  def bulk_update
    @contacts = Contact.all
  end
end
