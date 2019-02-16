/* global $ */
/* global Stripe */

// Document ready function
$(document).on('turbolinks: load', function(){
    var theForm = $('#pro-form');
    var submitBtn = $('#form-signup-btn');
    
    // set Stripe public key
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
    
    // write event handler for when user clicks submit button, prevent default 
    // behavior by pausing the screen.
    submitBtn.click(function(event) {
        event.preventDefault();
        
        // disable submit button
        submitBtn.val("Processing....").prop('disabled', true);
        
        // collect credit card fields
        var ccNum = $('#card_number').val();     
        var cvcNum = $('#card_code').val();
        var expMonth = $('#card_month').val();
        var expYear = $('#card_year').val();
        
        // use Stripe JS library to check for card errors
        var error = false;
        
        // validate card number
        if (!Stripe.card.validateCardNumber(ccNum)) {
            error = true;
            alert('The Credit Card number appears to be invalid');
        }
        // validate CVC number
        if (!Stripe.card.validateCVC(cvcNum)) {
            error = true;
            alert('The CVC number appears to be invalid');
        }
        // validate expiration Date
        if (!Stripe.card.validateExpiry(expMonth, expYear)) {
            error = true;
            alert('The Expiration Date appears to be invalid')
        }

        if (error) {
            // if there are errors, don't send to Stripe
            // enable Submit button again
            submitBtn.val("Sign Up").prop('disabled', false);
        } else {
            // send cc fields to stripe
            Stripe.createToken({
                number: ccNum,
                cvc: cvcNum,
                exp_month: expMonth,
                exp_year: expYear
            }, stripeResponseHandler);
        }
        
        return false;
    });

    // Stripe will return a Card Token
    function stripeResponseHandler(status, response) {
        // get the token from the response
        var token = response.id;
        
        // Inject Card Token as hidden field into Pro form
        theForm.append( $('<input type="hidden" name="user[stripe_card_token]">').val(token) );
        
        // submit for to our Rails app
        theForm.get(0).submit();    
    };
});


    
    

