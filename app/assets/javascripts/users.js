/* global $ */
/* global Stripe */

// Document ready function
$(document).on('turbolinks: load', function(){
    var theForm = $('#pro-form');
    var submitBtn = $('#form-submit-btn');
    
    // set Stripe public key
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
    
    // write event handler for when user clicks submit button, prevent default 
    // behavior by pausing the screen.
    submitBtn.click(function(event) {
        event.preventDefault();
        
    // collect credit card fields
    var ccNum = $('#card_number').val();     
    var cvcNum = $('#card_code').val();
    var expMonth = $('#card_month').val();
    var expYear = $('#card_year').val();
        
    // send cc fields to stripe
    Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
    }, stripeResponseHandler);
});


    
    
    // Stripe will return a Card Token
    // Inject Card Token as hidden field into Pro form
    // submit for to our Rails app
});
