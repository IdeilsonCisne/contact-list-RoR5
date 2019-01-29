class ContactsController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contact
  end

  def show
  end

  def new
    @contact = Contact.new
    @action = 'create'
  end

  def edit
    @action = 'update'
  end

  def create
    @contact = current_user.contact.build(contact_params)

    if @contact.save
      redirect_to contacts_path, alert: "Contact created successfully!"
    else
      render :new, alert: "Failed to create contact!"
    end
  end

  def update
    if @contact.update(contact_params)
    #if Contact.find(params[:id]).update(contact_params)
      redirect_to contacts_path, alert: "Contact updated successfully!"
    else
      render :edit, alert: "Failed to update contact!"
    end
  end

  def destroy
    # @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: 'Contact destroyed with success.'
    # @contact.destroy
  end

  private

  def set_contact
    @contact = current_user.contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone)
  end

end
