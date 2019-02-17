class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # associates users with plans
  belongs_to :plan 
  
  attr_accessor :stripe_card_token
  # If Pro user passes validation(email, password, etc), then call Stripe and tell
  # Stripe to setup a monthly subscription upon charging the customer credit card.
  def save_with_subscription 
    if valid?
      puts("Stripe Token = #{ @stripe_card_token }")
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id 
      save!
    end
  end
end
