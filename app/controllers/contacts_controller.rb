class ContactsController < ApplicationController

def new
  @contact = Contact.new
  end

def create
  @contact = Contact.new(contact_params)
  @user = User.find_or_create_by( email: params[:contact][:email] )
  @contact.user = @user
  if @contact.save
    redirect_to thank_contacts_path
    name = params[:contact][:name]
    email = params[:contact][:email]
    message = params[:contact][:message]

    ContactMailer.contact_email(name, email, message).deliver

  else
    redirect_to root_path
    flash[:danger] = "Opps, there was a problem! Please fill out all the fields."
  end
 end

 private

 def contact_params
 params.require(:contact).permit(:name, :email, :message)
 end

end
