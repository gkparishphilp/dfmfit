class ContactAdminController < ApplicationAdminController

    def index
      @contacts = Contact.page( params[:page] )

    end

    def show
      @contact = Contact.find(params[:id])
    end
end
