class Users::RegistrationsController < Devise::RegistrationsController
    # Extend default Devise behavior so that users signing up with the Pro 
    # account (type 2) save with a special Stripe subscription function.
    # Otherwise Stripe processes a free subscription (Plan 1)
    def create
        super do |resource| 
            if params[:plan] 
                resource.plan_id = params[:plan]
                # if this is a pro plan
                if resource.plan_id == 2
                    resource.save_with_subscription
                else 
                    resource.save 
                end
            end
        end
    end
end
