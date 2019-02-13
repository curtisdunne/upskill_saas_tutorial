class ContactsController < ApplicationController 
    # GET request to /contact-us
    # Show new Contact form
    def new
        @contact = Contact.new
    end
    
    # POST request to /contacts
    def create
        # Mass assignment of form fields into contact object
        @contact = Contact.new(contact_params)
        # Save Contact object to database
        if @contact.save
            # Store form fields via parameters into local variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            # Create email and send
            ContactMailer.contact_email(name, email, body).deliver
            # Display success message in Flash hash and redirect to the new action.
            flash[:success] = "Message Sent."
            redirect_to new_contact_path
        else 
            # if Contact object doesn't save, store errors in Flash hash
            # and redirect to the new action.
            flash[:danger] = @contact.errors.full_messages.join(": ")
            redirect_to new_contact_path
        end
    end
    
    private 
        # To collect data from form, we need to use strong parameters and 
        # whitelist the form fields we want to save (security feature)
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end
