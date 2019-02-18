class ProfilesController < ApplicationController 
   
    # GET to /users/"user_id/profile/new
    def new 
        # Render blank profile details form
        @profile = Profile.new
    end
    
    # POST request to /profiles
    def create
        @user = User.find(params[:user_id])
        
        # Mass assignment of form fields into Profile object
        # using this technique insures that the profile user_id is properly
        # associated to this new Profile record
        @profile = @user.build_profile(profile_params)
        
        # Save Profile object to database
        if @profile.save
            flash[:success] = "Profile Saved."

            redirect_to root_path
        else 
            # if Profile object doesn't save, store errors in Flash hash
            # and redirect to the new action.
            flash[:danger] = @contact.errors.full_messages.join(": ")
            # stays on Profile entry form with fields populated with entered values 
            render action: :new
        end
    end
    
    private 
        # To collect data from form, we need to use strong parameters and 
        # whitelist the form fields we want to save (security feature)
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
end
