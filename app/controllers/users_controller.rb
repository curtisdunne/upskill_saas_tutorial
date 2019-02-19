class UsersController < ApplicationController 
   before_action :authenticate_user!
   
   # Get to /users/:id   
   def show
       @user = User.find(params[:id])
   end
   
   def index
      # the includes creates just one query...saves time and response.
      @users = User.includes(:profile)
   end
   
end