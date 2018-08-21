class ContactsController < ApplicationController
    def new
        @contact =Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        @contact.request = request
        if @contact.deliver
            flash.now[:error] = nil
        else
            flash.now[:error] = 'Cannot send message.'
            render :new
        end
    end
end
