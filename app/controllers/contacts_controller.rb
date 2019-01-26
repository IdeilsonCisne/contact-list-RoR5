class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit

  end

  def create
    @contact = Contact.new(contact_params)
  end

  def update

  end

  def destroy

  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
