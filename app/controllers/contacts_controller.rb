class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    @action = 'create'
  end

  def edit
    @contact = Contact.find(params[:id])
    @action = 'update'
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_path, alert: "Contact created successfully!"
    else
      render :new, alert: "Failed to create contact!"
    end
  end

  def update
    if Contact.find(params[:id]).update(contact_params)
      redirect_to contacts_path, alert: "Contact updated successfully!"
    else
      render :edit, alert: "Failed to update contact!"
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    redirect_to contacts_path, notice: 'Contact destroyed with success.'
    @contact.destroy
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
