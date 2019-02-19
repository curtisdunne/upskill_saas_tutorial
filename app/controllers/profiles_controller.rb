class ProfilesController < ApplicationController 
    before_action :authenticate_user!
    before_action :only_current_user
   
    # GET to /users/"user_id/profile/new
    def new 
        # Render blank profile details form
        @profile = Profile.new
    end
    
    # POST request to /users/:user_id/profile
    def create
        @user = User.find(params[:user_id])
        
        # Mass assignment of form fields into Profile object
        # using this technique insures that the profile user_id is properly
        # associated to this new Profile record
        @profile = @user.build_profile(profile_params)
        
        # Save Profile object to database
        if @profile.save
            flash[:success] = "Profile Saved."

            redirect_to user_path(id: params[:user_id])
        else 
            # if Profile object doesn't save, store errors in Flash hash
            # and redirect to the new action.
            flash[:danger] = @contact.errors.full_messages.join(": ")
            # stays on Profile entry form with fields populated with entered values 
            # does not make another request.
            render action: :new
        end
    end
    
    # GET to /users/:user_id/profile/edit
    def edit 
        @user = User.find(params[:user_id])
        @profile = @user.profile
    end
    
    # PUT to /users/:user_id/profile
    def update
        #  retrieve the user from database
        @user = User.find(params[:user_id])
        # retrieve the users profile
        @profile = @user.profile
        # mass assign edited profile attributes
        if @profile.update_attributes(profile_params)
            flash[:success]
            redirect_to user_path(id: @user.id)
        else 
            render action: edit
        end
    end
    
    private 
        # To collect data from form, we need to use strong parameters and 
        # whitelist the form fields we want to save (security feature, strong parameters)
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end
        
        def only_current_user
           @user = User.find(params[:user_id])
           redirect_to(root_url) unless @user == current_user
        end
end
